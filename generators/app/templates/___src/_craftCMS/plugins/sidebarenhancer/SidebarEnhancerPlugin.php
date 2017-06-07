<?php
namespace Craft;

class SidebarEnhancerPlugin extends BasePlugin
{

    public function getName()
    {
        return 'Sidebar enhancer';
    }

    public function getDescription()
    {
        return 'Adds \'System\' and \'Content\' options to Craft\'s sidebar.';
    }

    public function getDocumentationUrl()
    {
        return 'https://github.com/picdorsey/craft-sidebarenhancer/blob/master/readme.md';
    }

    public function getVersion()
    {
        return '1.0.6';
    }

    public function getReleaseFeedUrl()
    {
        return 'https://raw.githubusercontent.com/picdorsey/craft-sidebarenhancer/master/releases.json';
    }

    public function getSchemaVersion()
    {
        return '1.0.0';
    }

    public function getDeveloper()
    {
        return 'Piccirilli Dorsey, Inc.';
    }

    public function getDeveloperUrl()
    {
        return 'https://github.com/picdorsey';
    }

    public function init()
    {
        parent::init();
        if (craft()->request->isCpRequest() && craft()->userSession->isAdmin()) {
            $this->_renderCSS();
            $this->_renderJS();
        }
    }

    private function _renderCSS()
    {
        craft()->templates->includeCssFile(UrlHelper::getResourceUrl('sidebarenhancer/sidebarEnhancer_style.css'));
    }

    private function _renderJS()
    {
        craft()->templates->includeJsFile(UrlHelper::getResourceUrl('sidebarenhancer/sidebarEnhancer_script.js'));
    }

}
