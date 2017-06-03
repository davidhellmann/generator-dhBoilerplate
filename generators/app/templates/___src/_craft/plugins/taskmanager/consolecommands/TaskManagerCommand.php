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
class TaskManagerCommand extends BaseCommand
{
    /**
     * Runs pending tasks.
     *
     * @return int
     */
    public function actionRun()
    {
        Craft::log(Craft::t('Running new tasks.'));

        // Start running tasks
        craft()->tasks->runPendingTasks();

        return 1;
    }

    /**
     * Watch for tasks and run them.
     */
    public function actionWatch()
    {
        Craft::log(Craft::t('Watching for new tasks.'));

        // Keep on checking for pending tasks
        while (true) {

            // Open db connection, if closed
            craft()->db->setActive(true);

            // Reset next pending tasks cache
            $this->resetCraftNextPendingTasksCache();

            // Start running tasks
            craft()->tasks->runPendingTasks();

            // Close db connection, if open
            craft()->db->setActive(false);

            // Sleep a little
            sleep(craft()->config->get('taskInterval', 'taskManager'));
        }
    }

    /**
     * Reset craft next pending task cache using reflection.
     */
    private function resetCraftNextPendingTasksCache()
    {
        $obj = craft()->tasks;
        $refObject = new \ReflectionObject($obj);
        $refProperty = $refObject->getProperty('_nextPendingTask');
        $refProperty->setAccessible(true);
        $refProperty->setValue($obj, null);
    }
}
