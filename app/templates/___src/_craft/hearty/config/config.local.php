<?php

/*
*	Config file: Local environment
*
*/

return array(

    'db' => array(
        'server' => 'localhost',
        'user' => 'YOUR DATABASE USER',
        'password' => 'YOUR DATABASE PASSWORD',
        'database' => 'YOUR DATABASE NAME',
    ),

    'devMode' => true,
    'phpMaxMemoryLimit' => '512M',
    'backupDbOnUpdate' => true,
    'translationDebugOutput' => false,
    'useCompressedJs' => false,
    'enableTemplateCaching' => false,
    'userSessionDuration' => 'P101Y',
    'rememberedUserSessionDuration' => 'P101Y',
    'rememberUsernameDuration' => 'P101Y',
    'addTrailingSlashesToUrls' => false,
    'limitAutoSlugsToAscii' => true, // default false
    'omitScriptNameInUrls' => true, // default false
    'pageTrigger' => 'p',
    'defaultCpLanguage' => 'en',
    'convertFilenamesToAscii' => true, // Default false
    'generateTransformsBeforePageLoad' => true, // Default false
    'imageDriver' => 'imagick',
    'maxUploadFileSize' => '16777216', // 16MB
    'rotateImagesOnUploadByExifData' => false,

    'testToEmailAddress' => 'YOUR MAIL FOR TESTING',

);
