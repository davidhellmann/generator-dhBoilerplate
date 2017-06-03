Task Manager plugin for Craft CMS [![Build Status](https://travis-ci.org/boboldehampsink/taskmanager.svg?branch=develop)](https://travis-ci.org/boboldehampsink/taskmanager) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/boboldehampsink/taskmanager/badges/quality-score.png?b=develop)](https://scrutinizer-ci.com/g/boboldehampsink/taskmanager/?branch=develop) [![Code Coverage](https://scrutinizer-ci.com/g/boboldehampsink/taskmanager/badges/coverage.png?b=develop)](https://scrutinizer-ci.com/g/boboldehampsink/taskmanager/?branch=develop) [![Latest Stable Version](https://poser.pugx.org/boboldehampsink/taskmanager/v/stable)](https://packagist.org/packages/boboldehampsink/taskmanager) [![Total Downloads](https://poser.pugx.org/boboldehampsink/taskmanager/downloads)](https://packagist.org/packages/boboldehampsink/taskmanager) [![Latest Unstable Version](https://poser.pugx.org/boboldehampsink/taskmanager/v/unstable)](https://packagist.org/packages/boboldehampsink/taskmanager) [![License](https://poser.pugx.org/boboldehampsink/taskmanager/license)](https://packagist.org/packages/boboldehampsink/taskmanager)
=================

Adds a "Task Manager" section to your CP to easily cancel or delete Craft Tasks.

__Important__  
 - The plugin's folder should be named "taskmanager"

Features
=================
 - View detail task info
 - Cancel running tasks
 - Rerun running or failed tasks
 - If you set up a cronjob to run /actions/taskManager/rerunAllFailedTasks, you can automatically rerun failed tasks
 - Comes with two console commands, one to run pending tasks and one to watch for pending tasks and run them.
 - Has an endpoint for Hirefire, see http://support.hirefire.io/help/kb/guides/any-programming-language

To run pending tasks just run

```
./craft/app/etc/console/yiic taskmanager run
```

To watch for pending tasks and them run them, run

```
./craft/app/etc/console/yiic taskmanager watch
```

Development
=================
Run this from your Craft installation to test your changes to this plugin before submitting a Pull Request
```bash
phpunit --bootstrap craft/app/tests/bootstrap.php --configuration craft/plugins/taskmanager/phpunit.xml.dist --coverage-clover coverage.clover craft/plugins/taskmanager/tests
```

Changelog
=================
###0.4.3###
 - Added the ability to get pending tasks in Hirefire.io format
 - Recycle db connection

###0.4.2###
 - Fixed bug with reading default config values

###0.4.1###
 - Added the ability to control the watch interval via the `taskInterval` config setting

###0.4.0###
 - Added the ability to run and watch for tasks via the command line.

###0.3.1###
 - Updated the plugin for Craft 2.5
 - The hook "modifyTaskManagerAttributes" is now "defineAdditionalTaskManagerTableAttributes"
 - Added description and documentation url

###0.3.0###
 - Added sources by type
 - Replaced action buttons by element actions
 - Added endpoint for rerunning all failed tasks
 - Added the ability to restart hanging tasks after a given timeout
 - Added "modifyTaskManagerSources" hook
 - Added "addTaskManagerActions" hook
 - Added "modifyTaskManagerTableAttributes" hook
 - Added "getTaskManagerTableAttributeHtml" hook
 - Added "modifyTaskManagerSortableAttributes"

###0.2.0###
 - Added the ability to restart a task
 - Deleting a task is now more graceful

###0.1.0###
 - Initial release
