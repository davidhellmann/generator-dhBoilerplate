<?php

/*
*	Config file: Local environment
*
*/

return array(

  'db' => array(
    'server'    => 'localhost',
    'user'      => 'YOUR DATABASE USER',
    'password'  => 'YOUR DATABASE PASSWORD',
    'database'  => 'YOUR DATABASE NAME',
  ),

  'devMode' => true,
  'phpMaxMemoryLimit' => '256M',
  'backupDbOnUpdate' => true,
  'translationDebugOutput' => false,
  'useCompressedJs' => false,
  'enableTemplateCaching' => false,
  'userSessionDuration'           => 'P101Y',
  'rememberedUserSessionDuration' => 'P101Y',
  'rememberUsernameDuration'      => 'P101Y',

  //'testToEmailAddress'  => 'YOUR MAIL FOR TESTING',

);
