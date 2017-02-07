<?php

/**
 * Task Manager.
 *
 * @author    Bob Olde Hampsink <b.oldehampsink@itmundi.nl>
 * @copyright Copyright (c) 2015, Bob Olde Hampsink
 * @license   MIT
 *
 * @link      http://github.com/boboldehampsink
 */
return array(

    // How long should we wait before we forfeit a task as hanging?
    'taskTimeout' => 0,

    // At what interval should the watcher watch for new tasks? (in seconds)
    'taskInterval' => 10,

    // Hirefire.io token
    'hirefireToken' => getenv('HIREFIRE_TOKEN'),

    // Name of the task worker you're using (if using Heroku + Hirefire.io)
    'hirefireWorker' => 'worker',
);
