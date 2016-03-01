'use strict';

import requireDir from 'require-dir';

global.changedOverride = false;

requireDir('./gulp/tasks', { recurse: true });
