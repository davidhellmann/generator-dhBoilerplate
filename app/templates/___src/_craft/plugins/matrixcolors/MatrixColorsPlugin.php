<?php
namespace Craft;

class MatrixColorsPlugin extends BasePlugin
{

	private $_matrixBlockColors;

	public function init()
	{
		parent::init();
		if (craft()->request->isCpRequest()) {
			$this->_colorBlocks();
		}
	}

	public function getName()
	{
		return Craft::t('Matrix Colors');
	}

	public function getDescription()
	{
		return 'Identify your matrix blocks by giving each type a different color.';
	}

	public function getDocumentationUrl()
	{
		return 'https://github.com/lindseydiloreto/craft-matrixcolors';
	}

	public function getVersion()
	{
		return '1.1.3';
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
		return 'https://github.com/lindseydiloreto/craft-matrixcolors';
		//return 'http://doublesecretagency.com';
	}

	protected function defineSettings()
	{
		return array(
			'matrixBlockColors' => array(AttributeType::Mixed, 'label' => 'Matrix Block Colors', 'default' => array()),
		);
	}

	public function getSettingsHtml()
	{
		// If not set, create a default row
		if (!$this->_matrixBlockColors) {
			$this->_matrixBlockColors = array(array('blockType' => '', 'backgroundColor' => ''));
		}
		// Generate table
		$matrixBlockColorsTable = craft()->templates->renderMacro('_includes/forms', 'editableTableField', array(
			array(
				'label'        => Craft::t('Block Type Colors'),
				'instructions' => Craft::t('Add background colors to your matrix block types'),
				'id'           => 'matrixBlockColors',
				'name'         => 'matrixBlockColors',
				'cols'         => array(
					'blockType' => array(
						'heading' => Craft::t('Block Type Handle'),
						'type'    => 'singleline',
					),
					'backgroundColor' => array(
						'heading' => Craft::t('CSS Background Color'),
						'type'    => 'singleline',
						'class'   => 'code',
					),
				),
				'rows' => $this->_matrixBlockColors,
				'addRowLabel'  => Craft::t('Add a block type color'),
			)
		));
		// Settings JS
		craft()->templates->includeJsResource('matrixcolors/js/settings.js');
		// Output settings template
		return craft()->templates->render('matrixcolors/_settings', array(
			'matrixBlockColorsTable' => TemplateHelper::getRaw($matrixBlockColorsTable),
		));
	}

	private function _colorBlocks()
	{
		$this->_matrixBlockColors = $this->getSettings()->matrixBlockColors;
		$css = '';
		$colorList = array();
		// Loop through block colors
		if ($this->_matrixBlockColors) {
			foreach ($this->_matrixBlockColors as $row) {
				// Set color
				$color = $row['backgroundColor'];
				// Split comma-separated strings
				$types = explode(',', $row['blockType']);
				// Loop over each block type
				foreach ($types as $type) {
					$type = trim($type);
					// Ignore empty strings
					if (empty($type)) {
						continue;
					}
					// Add type to color list
					$colorList[] = $type;
					// Set CSS for type
					$css .= "
.mc-solid-{$type} {background-color: {$color};}
.btngroup .btn.mc-gradient-{$type} {background-image: linear-gradient(white,{$color});}";
				}
			}
			// Load CSS
			craft()->templates->includeCss($css);
		}
		// Load JS
		craft()->templates->includeJs('var colorList = '.json_encode($colorList).';');
		craft()->templates->includeJsResource('matrixcolors/js/matrixcolors.js');
	}

}
