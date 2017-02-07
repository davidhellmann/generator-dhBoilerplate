<?php

namespace Craft;

/**
 * Task Manager Delete Element Action.
 *
 * @author    Bob Olde Hampsink <b.oldehampsink@itmundi.nl>
 * @copyright Copyright (c) 2015, Bob Olde Hampsink
 * @license   MIT
 *
 * @link      http://github.com/boboldehampsink
 */
class TaskManager_DeleteElementAction extends BaseElementAction
{
    /**
     * Get element action name.
     *
     * @return string
     */
    public function getName()
    {
        return Craft::t('Delete task(s)');
    }

    /**
     * Delete given task.
     *
     * @param ElementCriteriaModel $criteria
     *
     * @return bool
     */
    public function performAction(ElementCriteriaModel $criteria)
    {
        foreach ($criteria->id as $taskId) {
            craft()->tasks->deleteTaskById($taskId);
        }

        $this->setMessage(Craft::t('Task(s) deleted.'));

        return true;
    }
}
