<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the default settings in `vendor/craftcms/cms/src/config/defaults/general.php`.
 */

return [
    // Base site URL
    'siteUrl' => getenv('SITE_URL'),

    // Default Week Start Day (0 = Sunday, 1 = Monday...)
    'defaultWeekStartDay' => 0,

    // Enable CSRF Protection (recommended, will be enabled by default in Craft 3)
    'enableCsrfProtection' => true,

    // Whether "index.php" should be visible in URLs (true, false, "auto")
    'omitScriptNameInUrls' => 'auto',

    // Control Panel trigger word
    'cpTrigger' => 'admin',

    // Dev Mode (see https://craftcms.com/support/dev-mode)
    'devMode' => false,

    // Custom Settings
    'defaultCpLanguage' => 'en',

    /**
     * The default options that should be applied to each search term.
     *
     * Options include:
     *
     * - `attribute` – The attribute that the term should apply to (e.g. 'title'), if any
     * - `exact` – Whether the term must be an exact match (only applies if `attribute` is set)
     * - `exclude` – Whether search results should *exclude* records with this term
     * - `subLeft` – Whether to include keywords that contain the term, with additional characters before it
     * - `subRight` – Whether to include keywords that contain the term, with additional characters after it
     */
    'defaultSearchTermOptions' => [
        'attribute' => null,
        'exact' => false,
        'exclude' => false,
        'subLeft' => true,
        'subRight' => true,
    ],

    /**
     * The default day that new users should have set as their “Week Start Day”.
     *
     * This should be set to an int from `0` to `6` where:
     *
     * - `0` represents Sunday
     * - `1` represents Monday
     * - `2` represents Tuesday
     * - `3` represents Wednesday
     * - `4` represents Thursday
     * - `5` represents Friday
     * - `6` represents Saturday
     */
    'defaultWeekStartDay' => 1,

    'rootUrl' => getenv('ROOT_URL')
];
