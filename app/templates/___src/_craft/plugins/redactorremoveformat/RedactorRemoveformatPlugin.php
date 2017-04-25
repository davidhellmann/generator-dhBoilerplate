<?php
namespace Craft;

/**
 * Redactor JS plugin
 */
class RedactorRemoveformatPlugin extends BasePlugin
{
	public function getName()
	{
		return 'Redactor Removeformat';
	}

	public function getVersion()
	{
		return '1.0';
	}

	public function getDeveloper()
	{
		return 'kreisvier communications';
	}

	public function getDeveloperUrl()
	{
		return 'http://www.kreisvier.ch';
	}

    public function getDescription()
    {
        return 'Craft Redactor Remove Format is a Plugin for Craft CMS. It removes all formattings from the selected text in redactor.';
    }	

	public function init()
	{
		if (craft()->request->isCpRequest())
		{
			craft()->templates->includeJsResource('redactorremoveformat/removeformat.js');
		}
	}
}
