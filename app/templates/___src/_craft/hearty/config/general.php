<?php

/*

GENERAL/COMMON SETTINGS

NOTE: Shouldnt really have to touch this file except to change default/common config settings for all environments – for environment specific settings, create an individual config.{CRAFT_ENVIRONMENT}.php file! Note that any config setting in this file can be overridden in the latter.

Documentation on all Craft config settings can be found here: http://buildwithcraft.com/docs/config-settings

*/

$customConfig = array(

    // Applies to all environments
    '*' => array(

        <% if (craftMultilang == true) {
        %>
        // Set URL for Multilang
        'siteUrl' => array(
            'de' => CRAFT_SITE_URL,
            'en' => CRAFT_SITE_URL . 'en'
        ),
        <% } else { %>
        'siteUrl' => CRAFT_SITE_URL,
        <% } %>
        'environmentVariables' => array(
            'rootUrl' => CRAFT_SITE_URL,
            'basePath' => BASEPATH,
            'pubPath' => PUBPATH,
            'uploadPath' => PUBPATH . 'uploads',
            'uploadUrl' => CRAFT_SITE_URL . 'uploads',
            // 'imagePath' => PUBPATH . 'uploads/images',
            // 'imageUrl' => CRAFT_SITE_URL . 'uploads/images',
            // 'assetsPath' => PUBPATH . 'assets',
            // 'assetsUrl' => CRAFT_SITE_URL . 'assets',
        ),

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
        'environment' => CRAFT_ENVIRONMENT
    )

    // You can add additional environments here, but I'd recommend creating individual config.{CRAFT_ENVIRONMENT}.php files instead

);

// If an environment config file exists, merge settings.
if (is_array($customEnvConfig = @include(CRAFT_CONFIG_PATH . 'config.' . CRAFT_ENVIRONMENT . '.php'))) {
    if (isset($customEnvConfig['db'])) {
        unset($customEnvConfig['db']);
    }
    $customConfig[CRAFT_ENVIRONMENT] = array_merge(isset($customConfig[CRAFT_ENVIRONMENT]) ? $customConfig[CRAFT_ENVIRONMENT] : array(), $customEnvConfig);
}

return $customConfig;
