<?php

namespace Craft;

/**
 * Task Manager.
 *
 * @author    Bob Olde Hampsink <b.oldehampsink@itmundi.nl>
 * @copyright Copyright (c) 2015, Bob Olde Hampsink
 * @license   MIT
 *
 * @link      http://github.com/boboldehampsink
 */
class TaskManagerElementType extends BaseElementType
{
    /**
     * Returns the element type name.
     *
     * @return string
     */
    public function getName()
    {
        return Craft::t('Task Manager');
    }

    /**
     * Returns whether this element type has content.
     *
     * @return bool
     */
    public function hasContent()
    {
        return false;
    }

    /**
     * Returns whether this element type has titles.
     *
     * @return bool
     */
    public function hasTitles()
    {
        return false;
    }

    /**
     * Returns whether this element type has statuses.
     *
     * @return bool
     */
    public function hasStatuses()
    {
        return true;
    }

    /**
     * Returns this element's statuses.
     *
     * @return array
     */
    public function getStatuses()
    {
        return array(
            EntryModel::PENDING => Craft::t('Pending'),
            EntryModel::EXPIRED => Craft::t('Error'),
            EntryModel::LIVE    => Craft::t('Running'),
        );
    }

    /**
     * Return sources.
     *
     * @param string $context
     *
     * @return array
     */
    public function getSources($context = null)
    {
        $sources = array(
            '*' => array(
                'label'    => Craft::t('All tasks'),
                'criteria' => array('editable' => true),
            ),
        );

        // Get sources by type
        $results = craft()->db->createCommand()
            ->select('id, type')
            ->from('tasks')
            ->order('root asc, lft asc')
            ->group('type')
            ->queryAll();
        foreach ($results as $result) {
            $sources['type:'.$result['type']] = array(
                'label' => $result['type'],
                'data' => array('id' => $result['id']),
                'criteria' => array('type' => $result['type'], 'editable' => true),
            );
        }

        // Allow plugins to modify the sources
        craft()->plugins->call('modifyTaskManagerSources', array(&$sources, $context));

        return $sources;
    }

    /**
     * @inheritDoc IElementType::getAvailableActions()
     *
     * @param string|null $source
     *
     * @return array|null
     */
    public function getAvailableActions($source = null)
    {
        $actions = array();

        $restartAction = craft()->elements->getAction('TaskManager_Restart');
        $restartAction->setParams(array(
            'confirmationMessage' => Craft::t('Are you sure you want to restart the selected task(s)?'),
            'successMessage' => Craft::t('Task(s) restarted'),
        ));
        $actions[] = $restartAction;

        $deleteAction = craft()->elements->getAction('TaskManager_Delete');
        $deleteAction->setParams(array(
            'confirmationMessage' => Craft::t('Are you sure you want to delete the selected task(s)?'),
            'successMessage' => Craft::t('Task(s) deleted'),
        ));
        $actions[] = $deleteAction;

        // Allow plugins to add additional actions
        $allPluginActions = craft()->plugins->call('addTaskManagerActions', array($source), true);

        foreach ($allPluginActions as $pluginActions) {
            $actions = array_merge($actions, $pluginActions);
        }

        return $actions;
    }

    /**
     * @inheritDoc IElementType::defineAvailableTableAttributes()
     *
     * @return array
     */
    public function defineAvailableTableAttributes()
    {
        $attributes = array(
            'description' => Craft::t('Description'),
            'type'        => Craft::t('Type'),
            'dateCreated' => Craft::t('Created'),
            'currentStep' => Craft::t('Current step'),
            'totalSteps'  => Craft::t('Total steps'),
        );

        // Allow plugins to modify the attributes
        $pluginAttributes = craft()->plugins->call('defineAdditionalTaskManagerTableAttributes', array(), true);
        foreach ($pluginAttributes as $thisPluginAttributes) {
            $attributes = array_merge($attributes, $thisPluginAttributes);
        }

        return $attributes;
    }

    /**
     * @inheritDoc IElementType::getDefaultTableAttributes()
     *
     * @param string|null $source
     *
     * @return array
     */
    public function getDefaultTableAttributes($source = null)
    {
        return array(
            'description',
            'type',
            'dateCreated',
            'currentStep',
            'totalSteps',
        );
    }

    /**
     * Get table attribute html.
     *
     * @param BaseElementModel $element
     * @param string           $attribute
     *
     * @return string
     */
    public function getTableAttributeHtml(BaseElementModel $element, $attribute)
    {
        // First give plugins a chance to set this
        $pluginAttributeHtml = craft()->plugins->callFirst('getTaskManagerTableAttributeHtml', array($element, $attribute), true);

        if ($pluginAttributeHtml !== null) {
            return $pluginAttributeHtml;
        }

        // Or format default
        return parent::getTableAttributeHtml($element, $attribute);
    }

    /**
     * Define sortable attributes.
     *
     * @param string $source
     *
     * @return array
     */
    public function defineSortableAttributes($source = null)
    {
        $attributes = array(
            'type'        => Craft::t('Type'),
            'dateCreated' => Craft::t('Created'),
        );

        // Allow plugins to modify the attributes
        craft()->plugins->call('modifyTaskManagerSortableAttributes', array(&$attributes));

        return $attributes;
    }

    /**
     * Defines any custom element criteria attributes for this element type.
     *
     * @return array
     */
    public function defineCriteriaAttributes()
    {
        return array(
            'type'   => AttributeType::String,
            'dateCreated' => AttributeType::DateTime,
        );
    }

    /**
     * Modifies an element query targeting elements of this type.
     *
     * @param DbCommand            $query
     * @param ElementCriteriaModel $criteria
     *
     * @return mixed
     */
    public function modifyElementsQuery(DbCommand $query, ElementCriteriaModel $criteria)
    {
        // Default query
        $query
            ->select('id, currentStep, totalSteps, status, type, description, settings, dateCreated')
            ->from('tasks elements');

        // Reset default element type query parts
        $query->setJoin('');
        $query->setWhere('1=1');
        $query->setGroup('');
        unset($query->params[':locale']);
        unset($query->params[':elementsid1']);

        if ($criteria->type) {
            $query->andWhere(DbHelper::parseParam('type', $criteria->type, $query->params));
        }

        // Add search capabilities
        if ($criteria->search) {
            $query->andWhere(DbHelper::parseParam('description', '*'.$criteria->search.'*', $query->params));
            $criteria->search = null;
        }
    }

    /**
     * Populates an element model based on a query result.
     *
     * @param array $row
     *
     * @return array
     */
    public function populateElementModel($row)
    {
        return TaskManagerModel::populateModel($row);
    }
}
