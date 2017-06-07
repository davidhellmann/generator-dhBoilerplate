<?php

namespace TheIconic\Tracking\GoogleAnalytics\Parameters\EnhancedEcommerce;

use TheIconic\Tracking\GoogleAnalytics\Parameters\SingleParameter;

/**
 * Class TransactionId
 *
 * @link https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ti
 *
 * @package TheIconic\Tracking\GoogleAnalytics\Parameters\EnhancedEcommerce
 */
class TransactionId extends SingleParameter
{
    /**
     * @inheritDoc
     *
     * @var string
     */
    protected $name = 'ti';
}
