<?php

/**
 * Sample craft-cli Configuration file
 *
 * Rename this file to .craft-cli.php in your site root.
 */

// Quit if this is not being requested via the CLI
if (php_sapi_name() !== 'cli') {
    exit;
}

return array(
    /**
     * Craft path
     *
     * Specify the path to your craft folder
     * If you leave this blank, it will assume your
     * folder is <current directory>/craft
     */
    'craft_path' => __DIR__.'/___dist/craft/',

    /**
     * Craft config path
     *
     * Specify the path to your craft config folder
     * If you leave this blank, it will assume your
     * folder is <current directory>/craft/config
     */
    'craft_config_path' => __DIR__.'/___dist/config/',

    /**
     * Craft plugins path
     *
     * Specify the path to your craft plugins folder
     * If you leave this blank, it will assume your
     * folder is <current directory>/craft/plugins
     */
    'craft_plugins_path' => __DIR__.'/___dist/plugins/',

    /**
     * Craft storage path
     *
     * Specify the path to your craft storage folder
     * If you leave this blank, it will assume your
     * folder is <current directory>/craft/storage
     */
    'craft_storage_path' => __DIR__.'/___dist/craft/storage/',

    /**
     * Craft templates path
     *
     * Specify the path to your craft templates folder
     * If you leave this blank, it will assume your
     * folder is <current directory>/craft/templates
     */
    'craft_templates_path' => __DIR__.'/___dist/templates/',

    /**
     * Craft translations path
     *
     * Specify the path to your craft translations folder
     * If you leave this blank, it will assume your
     * folder is <current directory>/craft/translations
     */
    'craft_translations_path' => __DIR__.'/___dist/translations/',

    /**
     * Craft environment
     *
     * The server name of your craft environment.
     */
    'environment' => 'local',

    /**
     * Custom commands
     *
     * An array of Command class names of
     * custom commands.
     */
    'commands' => array(
        #'\\Your\\Custom\\Command',
    ),

    /**
     * Custom command directories
     *
     * An array of directories, keyed by a namespace prefix,
     * which will be crawled for Command classes.
     */
    'commandDirs' => array(
        /*
        '\\Your\\Namespace' => '/path/to/commands',
        */
    ),
);
