<?php
namespace Craft;

class CpJsPlugin extends BasePlugin
{

    public function init()
    {
        parent::init();
        if (craft()->request->isCpRequest()) {
            $this->_renderJs();
        }
    }

    public function getName()
    {
        return Craft::t('Control Panel JS');
    }

    public function getDescription()
    {
        return 'Add custom JavaScript to your Control Panel.';
    }

    public function getDocumentationUrl()
    {
        return 'https://github.com/lindseydiloreto/craft-cpjs';
    }

    public function getVersion()
    {
        return '1.1.0';
    }

    public function getSchemaVersion()
    {
        return '1.1.0';
    }

    public function getDeveloper()
    {
        return 'Double Secret Agency';
    }

    public function getDeveloperUrl()
    {
        return 'https://github.com/lindseydiloreto/craft-cpjs';
        //return 'http://doublesecretagency.com';
    }

    protected function defineSettings()
    {
        return array(
            'jsFile'       => array(AttributeType::String),
            'additionalJs' => array(AttributeType::String, 'column' => ColumnType::Text),
        );
    }

    public function getSettingsHtml()
    {
        $this->_loadCodeMirror();
        return craft()->templates->render('cpjs/_settings', array(
            'settings' => $this->getSettings(),
        ));
    }

    private function _loadCodeMirror()
    {
        if ($this->_actualSettingsPage()) {
            craft()->templates->includeCssResource('cpjs/css/codemirror.css');
            craft()->templates->includeCssResource('cpjs/css/blackboard.css');
            craft()->templates->includeJsResource('cpjs/js/codemirror-javascript.js');
            craft()->templates->includeJs('
$(function () {
    CodeMirror.fromTextArea(document.getElementById("settings-additionalJs"), {
        indentUnit: 4,
        styleActiveLine: true,
        lineNumbers: true,
        lineWrapping: true,
        theme: "blackboard"
    });
});', true);
        }
    }

    private function _actualSettingsPage()
    {
        $currentUrl = craft()->request->getUrl();
        $admin = craft()->config->get('cpTrigger');
        return ("/$admin/settings/plugins/cpjs" == $currentUrl);
    }

    private function _renderJs()
    {
        $settings = $this->getSettings();
        if (trim($settings->jsFile)) {
            $filepath = craft()->config->parseEnvironmentString($settings->jsFile);
            if ($hash = @sha1_file($filepath)) {
                craft()->templates->includeJsFile($filepath.'?e='.$hash);
            } else {
                craft()->templates->includeJsFile($filepath);
            }
        }
        if (trim($settings->additionalJs)) {
            craft()->templates->includeJs($settings->additionalJs);
        }
    }

}
