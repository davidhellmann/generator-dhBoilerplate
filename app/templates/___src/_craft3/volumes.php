<?php
/**
 * Asset Volume Configuration
 *
 * All of your system's volume configuration settings go in here.
 * Put the Asset Volume handle in `ASSET_HANDLE` key, and put the path
 * to the asset in `ASSET_PATH`. Create an array for each Asset Volume
 * your website uses.
 */
// $_ENV constants are loaded by craft3-multi-environment from .env.php via web/index.php

return [

    // All environments
    '*' => [
        'siteImages' => [
            'url' => getenv('CRAFTENV_BASE_URL') . 'uploads/images',
            'path' => getenv('CRAFTENV_BASE_PATH') . 'uploads/images',
        ],
        'siteDownloads' => [
            'url' => getenv('CRAFTENV_BASE_URL') . 'uploads/downloads',
            'path' => getenv('CRAFTENV_BASE_PATH') . 'uploads/downloads',
        ],
        'siteGraphics' => [
            'url' => getenv('CRAFTENV_BASE_URL') . 'uploads/graphics',
            'path' => getenv('CRAFTENV_BASE_PATH') . 'uploads/graphics',
        ],
        'siteUsers' => [
            'url' => getenv('CRAFTENV_BASE_URL') . 'uploads/users',
            'path' => getenv('CRAFTENV_BASE_PATH') . 'uploads/users',
        ],
    ],

    // Live (production) environment
    'live'  => [
    ],

    // Staging (pre-production) environment
    'staging'  => [
    ],

    // Local (development) environment
    'local'  => [
    ],
];
