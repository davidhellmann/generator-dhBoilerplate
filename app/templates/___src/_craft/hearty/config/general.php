<?php

/*

GENERAL/COMMON SETTINGS

NOTE: Shouldnt really have to touch this file except to change default/common config settings for all environments – for environment specific settings, create an individual config.{CRAFT_ENVIRONMENT}.php file! Note that any config setting in this file can be overridden in the latter.

Documentation on all Craft config settings can be found here: http://buildwithcraft.com/docs/config-settings

*/

$customConfig = array(

  // Applies to all environments
  '*' => array(

    <% if (craftMultilang == true ) { %>
    // Set URL for Multilang
    'siteUrl' => array(
        'de' => CRAFT_SITE_URL,
        'en' => CRAFT_SITE_URL . 'en'
    ),
    <% } else { %>
    'siteUrl' => CRAFT_SITE_URL,
    <% } %>

    /*
        *	General settings
        *
        */
    // 'appId' => null,
    // 'cacheDuration' => 'P1D', // One day
    // 'cacheMethod' => 'file', // 'apc', 'db', 'eaccelerator', 'file', 'memcache', 'redis', 'wincache', 'xcache', or 'zenddata'
    // 'customAsciiCharMappings' => array(),
    // 'defaultCookieDomain' => '',
    // 'devMode' => false,
    'environmentVariables' => array(
      'rootUrl' => CRAFT_SITE_URL,
      'basePath' => BASEPATH,
      'pubPath' => PUBPATH,
      'uploadPath' => BASEPATH . 'public/uploads',
      'uploadUrl' => CRAFT_SITE_URL . 'uploads',
      // 'imagePath' => PUBPATH . 'uploads/images',
      // 'imageUrl' => CRAFT_SITE_URL . 'uploads/images',
      // 'assetsPath' => PUBPATH . 'assets',
      // 'assetsUrl' => CRAFT_SITE_URL . 'assets',
    ),
    // 'isSystemOn' => true,
    // 'logDumpMethod' => 'var_export',
    // 'overridePhpSessionLocation' => false,
    // 'phpMaxMemoryLimit' => '256M',
    // 'phpSessionName' => 'CraftSessionId',
    // 'runTasksAutomatically' => true,
    // 'searchIgnoreWords' => array('the', 'and'),
    // 'sendPoweredByHeader' => true,
    // 'siteName' => null,
    // 'siteUrl' => CRAFT_SITE_URL,
    // 'timezone' => null,
    // 'translationDebugOutput' => false,
    // 'useCompressedJs' => true,
    // 'useWriteFileLock' => 'auto',
    // 'useXSendFile' => false,

    /*
        *	Security
        *
        */
    // 'csrfTokenName' => 'CRAFT_CSRF_TOKEN',
    // 'defaultFilePermissions' => 0664,
    // 'defaultFolderPermissions' => 0775,
    // 'defaultTokenDuration' => 'P1D', // one day
    // 'enableCsrfProtection' => false, // This setting will be set to true by default in Craft 3.0.
    // 'tokenParam' => 'token',
    // 'useSecureCookies' => 'auto',

    /*
        *	Updates
        *
        */
    // 'allowAutoUpdates' => true, // true, 'minor-only', 'build-only', or false
    // 'backupDbOnUpdate' => true,
    // 'restoreDbOnUpdateFailure' => true,
    // 'showBetaUpdates' => false,

    /*
        *	URLs
        *
        */
    // 'actionTrigger' => 'actions',
    'addTrailingSlashesToUrls' => true,
    // 'allowUppercaseInSlug' => false,
    // 'baseCpUrl' => null,
    // 'cpTrigger' => 'admin',
    'limitAutoSlugsToAscii' => true, // default false
    // 'maxSlugIncrement' => 100,
    'omitScriptNameInUrls' => true, // default false
    'pageTrigger' => 'p',
    // 'resourceTrigger' => 'cpresources',
    // 'slugWordSeparator' => '-',
    // 'usePathInfo' => 'auto',

    /*
        *	Templating
        *
        */
    // 'cacheElementQueries' => true,
    // 'defaultTemplateExtensions' => array('html', 'twig'),
    // 'enableTemplateCaching' => true,
    // 'errorTemplatePrefix' => '',
    // 'indexTemplateFilenames' => array('index'),
    // 'privateTemplateTrigger' => '_',

    /*
        *	Users
        *
        */
    // 'activateAccountFailurePath' => null,
    // 'activateAccountSuccessPath' => null,
    // 'autoLoginAfterAccountActivation' => false,
    // 'blowfishHashCost' => 13,
    // 'cooldownDuration' => 'PT5M', // Five minutes
    // 'defaultCpLanguage' => null,
    // 'invalidLoginWindowDuration' => 'PT1H', // One hour
    // 'invalidUserTokenPath' => '',
    // 'loginPath' => 'login',
    // 'logoutPath' => 'logout',
    // 'maxInvalidLogins' => 5,
    // 'postCpLoginRedirect' => 'dashboard',
    // 'postLoginRedirect' => '',
    // 'purgePendingUsersDuration' => 'P3M', // 3 months
    // 'rememberUsernameDuration' => 'P1Y', // 1 year
    // 'rememberedUserSessionDuration' => 'P2W', // 2 weeks
    // 'requireMatchingUserAgentForSession' => true,
    // 'requireUserAgentAndIpForSession' => true,
    // 'setPasswordPath' => 'setpassword',
    // 'setPasswordSuccessPath' => '',
    // 'testToEmailAddress' => null,
    // 'useEmailAsUsername' => false,
    // 'userSessionDuration' => 'PT1H', // 1 hour
    // 'verificationCodeDuration' => 'P1D', // 1 day

    /*
        *	Assets
        *
        */
    // 'allowedFileExtensions' => '7z, aiff, asf, avi, bmp, csv, doc, docx, fla, flv, gif, gz, gzip, htm, html, jpeg, jpg, js, mid, mov, mp3, mp4, m4a, m4v, mpc, mpeg, mpg, ods, odt, ogg, ogv, pdf, png, potx, pps, ppsm, ppsx, ppt, pptm, pptx, ppz, pxd, qt, ram, rar, rm, rmi, rmvb, rtf, sdc, sitd, svg, swf, sxc, sxw, tar, tgz, tif, tiff, txt, vob, vsd, wav, webm, wma, wmv, xls, xlsx, zip',
    'convertFilenamesToAscii' => true, // Default false
    // 'defaultImageQuality' => 75,
    // 'extraAllowedFileExtensions' => '',
    // 'filenameWordSeparator' => '-',
    'generateTransformsBeforePageLoad' => true, // Default false
    // 'imageDriver' => null,
    // 'maxCachedCloudImageSize' => 2000,
    // 'maxUploadFileSize' => '16777216', // 16MB
    // 'rotateImagesOnUploadByExifData' => true,


    /*
        *	Custom config values
        *
        */

    /* Environment */
    'environment' => CRAFT_ENVIRONMENT,
    // 'assetsUri' => '/assets/',
    // 'assetsUrl' => CRAFT_SITE_URL . 'assets/',
    // 'assetsPath' => PUBPATH . 'assets/',

  ),

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
