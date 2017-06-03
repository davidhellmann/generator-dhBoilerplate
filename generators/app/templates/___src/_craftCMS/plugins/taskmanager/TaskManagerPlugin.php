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
class TaskManagerPlugin extends BasePlugin
{
    /**
     * Get plugin name.
     *
     * @return string
     */
    public function getName()
    {
        return Craft::t('Task Manager');
    }

    /**
     * Get plugin description.
     *
     * @return string
     */
    public function getDescription()
    {
        return Craft::t('Adds a "Task Manager" section to your CP to easily cancel or delete Craft Tasks.');
    }

    /**
     * Get plugin version.
     *
     * @return string
     */
    public function getVersion()
    {
        return '0.4.3';
    }

    /**
     * Get plugin developer.
     *
     * @return string
     */
    public function getDeveloper()
    {
        return 'Bob Olde Hampsink';
    }

    /**
     * Get plugin developer url.
     *
     * @return string
     */
    public function getDeveloperUrl()
    {
        return 'https://github.com/boboldehampsink';
    }

    /**
     * Get plugin documentation url.
     *
     * @return string
     */
    public function getDocumentationUrl()
    {
        return 'https://github.com/boboldehampsink/taskmanager';
    }

    /**
     * Has Control Panel section.
     *
     * @return bool
     */
    public function hasCpSection()
    {
        return true;
    }

    /**
     * Register hirefire endpoint
     *
     * @return array
     */
    public function registerSiteRoutes()
    {
        return array(
            'hirefire/(?P<token>(.*?))/info' => array('action' => 'taskManager/getPendingTasks'),
        );
    }
}
