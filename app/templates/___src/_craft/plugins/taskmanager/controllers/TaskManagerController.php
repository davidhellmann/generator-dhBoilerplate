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
class TaskManagerController extends BaseController
{
    /**
     * Allow anonymous access (for a cronjob perhaps).
     *
     * @var bool
     */
    public $allowAnonymous = true;

    /**
     * Get pending tasks in Hirefire.io format
     *
     * @param array $variables
     *
     * @throws HttpException
     */
    public function actionGetPendingTasks(array $variables = array())
    {
        // Verify hirefire token
        if ($variables['token'] != craft()->config->get('hirefireToken', 'taskManager')) {
            throw new HttpException(400, Craft::t('Invalid Hirefire token.'));
        }

        // Return pending tasks for worker
        $this->returnJson(array(array(
            'name' => craft()->config->get('hirefireWorker', 'taskManager'),
            'quantity' => craft()->tasks->getTotalTasks(),
        )));
    }

    /**
     * Rerun all failed tasks.
     */
    public function actionRerunAllFailedTasks()
    {
        // Get all failed tasks
        $query = craft()->db->createCommand()
            ->select('id')
            ->from('tasks')
            ->where(array('and', 'lft = 1', 'status = :status'), array(':status' => TaskStatus::Error));

        // Get all hanging? tasks
        if ($timeout = craft()->config->get('taskTimeout', 'taskManager')) {
            $query->orWhere(array('and', 'lft = 1', 'dateCreated < (NOW() - INTERVAL :seconds SECOND)'), array(':seconds' => $timeout));
        }

        // Get all
        $tasks = $query->queryAll();

        // Loop through failed tasks
        foreach ($tasks as $task) {

            // Rerun task
            craft()->tasks->rerunTaskById($task['id']);
        }

        // Run pending tasks controller
        craft()->runController('tasks/runPendingTasks');
    }
}
