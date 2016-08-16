<?php

/*

	GENERAL/COMMON DATABASE CONFIGURATION

	NOTE: Shouldnt really have to touch this file except to change default/common config settings for all environments – for environment specific settings, create an individual config.{CRAFT_ENVIRONMENT}.php file! Note that any config setting in this file can be overridden in the latter.

	You can see a list of the default database settings in craft/app/etc/config/defaults/db.php

*/

$customConfig = array(

  '*' => array(

    /**
     * The database server name or IP address. Usually 'localhost' or '127.0.0.1'.
     */
    //'server' => 'localhost',

    /**
     * The database server port.
     */
    //'port' => '3306',

    /**
     * The database username to connect with.
     */
    //'user' => 'root',

    /**
     * The database password to connect with.
     */
    //'password' => '',

    /**
     * The name of the database to select.
     */
    //'database' => '',

    /**
     * The prefix to use when naming tables. This can be no more than 5 characters.
     */
    //'tablePrefix' => 'craft',

    /**
     * The charset to use when creating tables.
     */
    //'charset' => 'utf8',

    /**
     * The collation to use when creating tables.
     */
    //'collation' => 'utf8_unicode_ci',

    /**
     * If this is set, then the CLI connection string (used for yiic) will
     * connect to the Unix socket, instead of the server and port. If this is
     * specified, then 'server' and 'port' settings are ignored.
     */
    //'unixSocket' => '',

  ),

);

// If an environment config file exists, merge settings.

if (is_array($customEnvConfig = @include(CRAFT_CONFIG_PATH . 'config.' . CRAFT_ENVIRONMENT . '.php')) && isset($customEnvConfig['db'])) {
  $customConfig[CRAFT_ENVIRONMENT] = array_merge(isset($customConfig[CRAFT_ENVIRONMENT]) ? $customConfig[CRAFT_ENVIRONMENT] : array(), $customEnvConfig['db']);
}

return $customConfig;
