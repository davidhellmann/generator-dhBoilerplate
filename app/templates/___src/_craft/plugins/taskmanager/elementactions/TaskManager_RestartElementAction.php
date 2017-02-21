<?php

namespace Craft;

/**
 * Task Manager Restart Element Action.
 *
 * @author    Bob Olde Hampsink <b.oldehampsink@itmundi.nl>
 * @copyright Copyright (c) 2015, Bob Olde Hampsink
 * @license   MIT
 *
 * @link      http://github.com/boboldehampsink
 */
class TaskManager_RestartElementAction extends BaseElementAction
{
    /**
     * Get element action name.
     *
     * @return string
     */
    public function getName()
    {
        return Craft::t('Restart task(s)');
    }

    /**
     * Restart given tasks.
     *
     * @param ElementCriteriaModel $criteria
     *
     * @return bool
     */
    public function performAction(ElementCriteriaModel $criteria)
    {
        foreach ($criteria->id as $taskId) {
            craft()->tasks->rerunTaskById($taskId);
        }

        $this->setMessage(Craft::t('Task(s) restarted.'));

        return true;
    }
}
