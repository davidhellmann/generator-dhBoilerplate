'use strict'

import requireDir from 'require-dir'

// Define Global Vars
global.checkChanged = false

requireDir('./gulp/tasks', { recurse: true })
