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
class TaskManagerModel extends BaseElementModel
{
    /**
     * Element Type.
     *
     * @var string
     */
    protected $elementType = 'TaskManager';

    /**
     * Define attributes.
     *
     * @return array
     */
    protected function defineAttributes()
    {
        return array_merge(parent::defineAttributes(), array(
            'level'       => AttributeType::Number,
            'type'        => AttributeType::String,
            'description' => AttributeType::String,
            'parentId'    => AttributeType::Mixed,
            'totalSteps'  => AttributeType::Number,
            'currentStep' => AttributeType::Number,
            'settings'    => AttributeType::Mixed,
            'status'      => array(AttributeType::Enum, 'values' => array(TaskStatus::Pending, TaskStatus::Error, TaskStatus::Running), 'default' => TaskStatus::Pending),
        ));
    }

    /**
     * Get title.
     */
    public function getTitle()
    {
        return !empty($this->description) ? $this->description : Craft::t('No description');
    }

    /**
     * Returns the element's status.
     *
     * @return string
     */
    public function getStatus()
    {
        switch ($this->status) {

            case TaskStatus::Pending:
                return EntryModel::PENDING;

            case TaskStatus::Error:
                return EntryModel::EXPIRED;

            case TaskStatus::Running:
                return EntryModel::LIVE;

            default:
                return EntryModel::DISABLED;

        }
    }
}
