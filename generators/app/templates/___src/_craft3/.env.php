<?php
/**
 * Craft-Multi-Environment (CMS)
 * @author    nystudio107
 * @copyright Copyright (c) 2017 nystudio107
 * @link      https://nystudio107.com/
 * @package   craft3-multi-environment
 * @since     1.0.0
 * @license   MIT
 *
 * This file should be renamed to '.env.php' and it should reside in your root
 * project directory.  Add '/.env.php' to your .gitignore.  See below for production
 * usage notes.
 */

// Determine the incoming protocol
if (isset($_SERVER['HTTPS']) && (strcasecmp($_SERVER['HTTPS'], 'on') === 0 || $_SERVER['HTTPS'] == 1)
    || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') === 0
) {
    $protocol = "https://";
} else {
    $protocol = "http://";
}
// The $craftEnvVars are all auto-prefixed with CRAFTENV_ -- you can add
// whatever you want here and access them via getenv() using the prefixed name
$craftEnvVars = [
    // The Craft environment we're running in ('local', 'staging', 'live', etc.).
    'CRAFT_ENVIRONMENT' => 'local',

    // The database driver that will used ('mysql' or 'pgsql')
    'DB_DRIVER' => 'mysql',

    // The database server name or IP address (usually this is 'localhost' or '127.0.0.1')
    'DB_SERVER' => 'localhost',

    // The database username to connect with
    'DB_USER' => 'REPLACE_ME',

    // The database password to connect with
    'DB_PASSWORD' => 'REPLACE_ME',

    // The name of the database to select
    'DB_DATABASE' => 'REPLACE_ME',

    // The database schema that will be used (PostgreSQL only)
    'DB_SCHEMA' => 'public',

    // The prefix that should be added to generated table names (only necessary
    // if multiple things are sharing the same database)
    'DB_TABLE_PREFIX' => '',

    // The site url to use; it can be hard-coded as well
    'SITE_URL' => $protocol . $_SERVER['HTTP_HOST'] . '/',

    // The base url environmentVariable to use for Assets; it can be hard-coded as well
    // You will also need to configure `config/volumes.php` for your Asset Volumes
    'BASE_URL' => $protocol . $_SERVER['HTTP_HOST'] . '/',

    // The base path environmentVariable for Assets; it can be hard-coded as well
    // You will also need to configure `config/volumes.php` for your Asset Volumes
    'BASE_PATH' => realpath(dirname(__FILE__)) . '/web/',
];

// Set all of the .env values, auto-prefixed with `CRAFTENV_`
foreach ($craftEnvVars as $key => $value) {
    putenv("CRAFTENV_{$key}={$value}");
}
