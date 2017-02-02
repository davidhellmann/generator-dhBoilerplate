<?php
return [
    'siteImages' => [
        'path' => getenv('ASSETS_BASE_PATH') . '/images',
        'url' => getenv('ASSETS_BASE_URL') . '/images',
    ],
    'siteDownloads' => [
        'path' => getenv('ASSETS_BASE_PATH') . '/downloads',
        'url' => getenv('ASSETS_BASE_URL') . '/downloads',
    ],
    'siteGraphics' => [
        'path' => getenv('ASSETS_BASE_PATH') . '/graphics',
        'url' => getenv('ASSETS_BASE_URL') . '/graphics',
    ],
    'siteUsers' => [
        'path' => getenv('ASSETS_BASE_PATH') . '/users',
        'url' => getenv('ASSETS_BASE_URL') . '/user',
    ],
];
