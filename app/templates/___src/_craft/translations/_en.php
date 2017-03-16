<?php
namespace Craft;

if (craft()->request->isCpRequest())
{
    if (craft()->userSession->isAdmin())
    {
        return (include '../craft/app/translations/en_us.php');
    }
    else
    {
        $de = (include '../craft/app/translations/de.php');
        $custom = array(
            //'Globals' => 'I freak out!',
        );


        return array_merge($de, $custom);
    }
}
