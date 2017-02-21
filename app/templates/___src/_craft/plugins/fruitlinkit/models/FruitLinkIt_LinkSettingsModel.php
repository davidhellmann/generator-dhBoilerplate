<?php

/**
 * Link It by Fruit Studios
 *
 * @package   Link It
 * @author    Sam Hibberd
 * @copyright Copyright (c) 2015, Fruit Studios
 * @link      http://fruitstudios.co.uk
 * @license   http://fruitstudios.co.uk
 */

namespace Craft;

class FruitLinkIt_LinkSettingsModel extends BaseModel
{
    protected function defineAttributes()
    {
        $attributes = array(
            'types' => AttributeType::Mixed,
            'allowCustomText' => AttributeType::Bool,
            'defaultText' => AttributeType::String,
            'allowTarget' => AttributeType::Bool,

            'entrySources' => AttributeType::Mixed,
            'entrySelectionLabel' => array(AttributeType::String, 'default' => Craft::t('Select an entry')),

            'assetSources' => AttributeType::Mixed,
            'assetSelectionLabel' => array(AttributeType::String, 'default' => Craft::t('Select an asset')),

            'categorySources' => AttributeType::Mixed,
            'categorySelectionLabel' => array(AttributeType::String, 'default' => Craft::t('Select a category')),

            'productSources' => AttributeType::Mixed,
            'productSelectionLabel' => array(AttributeType::String, 'default' => Craft::t('Select a product')),
        );

        $thirdPartyElementTypes = craft()->fruitLinkIt->getThirdPartyElementTypes();
        foreach ($thirdPartyElementTypes as $elementTypeHandle => $elementTypeConfig) {
          $attributes = array_merge($attributes, array(
            $elementTypeHandle.'Sources' => AttributeType::Mixed,
            $elementTypeHandle.'SelectionLabel' => array(AttributeType::String, 'default' => $elementTypeConfig['selectionLabelDefault'])
          ));
        }

        return $attributes;
    }

    public function validate($attributes = null, $clearErrors = true)
    {
        parent::validate($attributes, $clearErrors);

        if(is_array($this->types))
        {
            if( in_array('entry', $this->types) && $this->entrySources == '')
            {
                $this->addError('entrySources', Craft::t('Please select at least 1 entry source.'));
            }

            if( in_array('asset', $this->types) && $this->assetSources == '')
            {
                $this->addError('assetSources', Craft::t('Please select at least 1 asset source.'));
            }

            if( in_array('category', $this->types) && $this->categorySources == '')
            {
                $this->addError('categorySources', Craft::t('Please select at least 1 category source.'));
            }

            if( in_array('product', $this->types) && $this->productSources == '')
            {
                $this->addError('productSources', Craft::t('Please select at least 1 product source.'));
            }

            // Handle third party element errors
            $thirdPartyElementTypes = craft()->fruitLinkIt->getThirdPartyElementTypes();
            foreach ($thirdPartyElementTypes as $elementTypeHandle => $elementTypeConfig) {
              if( in_array($elementTypeHandle, $this->types) && $this[$elementTypeHandle.'Sources'] == '')
              {
                  $this->addError($elementTypeHandle.'Sources', Craft::t('Please select at least 1 '.strtolower($elementTypeConfig['name']).' source.'));
              }
            }

        }
        else
        {
            $this->addError('types', Craft::t('Please select at least 1 link type.'));
        }

        return !$this->hasErrors();
    }
}
