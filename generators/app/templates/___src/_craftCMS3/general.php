<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the default settings in `vendor/craftcms/cms/src/config/defaults/general.php`.
 */

// $_ENV constants are loaded by craft3-multi-environment from .env.php via web/index.php
return [

    // All environments
    '*' => [

        // Whether "index.php" should be visible in URLs (true, false, "auto")
        'omitScriptNameInUrls' => 'true',
        'usePathInfo' => true,
        'cacheDuration' => false,
        'generateTransformsBeforePageLoad' => true,
        'defaultWeekStartDay' => 1,
        'enableCsrfProtection' => true,
        'cpTrigger' => 'admin',
        'defaultCpLanguage' => 'en',
        'maxUploadFileSize' => 67108864,
        'defaultSearchTermOptions' => [
            'attribute' => null,
            'exact' => false,
            'exclude' => false,
            'subLeft' => true,
            'subRight' => true,
        ],
        'siteUrl' => getenv('CRAFTENV_SITE_URL'),
        'rootUrl' => getenv('CRAFTENV_SITE_URL'),
        'craftEnv' => CRAFT_ENVIRONMENT,
    ],

    // Live (production) environment
    'live' => [
        'devMode' => false,
        'enableTemplateCaching' => true,
        'allowAutoUpdates' => false,
    ],

    // Staging (pre-production) environment
    'staging' => [
        'devMode' => false,
        'enableTemplateCaching' => true,
        'allowAutoUpdates' => false,
    ],

    // Local (development) environment
    'local' => [
        'devMode' => true,
        'enableTemplateCaching' => false,
        'allowAutoUpdates' => true,
    ]

];
