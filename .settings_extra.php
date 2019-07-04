<?php
return [
  'connections' =>
  [
    'value' =>
    [
      'default' =>
      [
        'className' => '\\Bitrix\\Main\\DB\\MysqliConnection',
        'host' => 'db',
        'database' => $_SERVER['MYSQL_DATABASE'],
        'login'    => $_SERVER['MYSQL_USER'],
        'password' => $_SERVER['MYSQL_PASSWORD'],
        'options' => 2,
      ],
    ],
    'readonly' => true,
  ],
  'pull' => [
      'value' =>  [
          'path_to_listener' => 'http://#DOMAIN#/bitrix/sub/',
          'path_to_listener_secure' => 'https://#DOMAIN#/bitrix/sub/',
          'path_to_modern_listener' => 'http://#DOMAIN#/bitrix/sub/',
          'path_to_modern_listener_secure' => 'https://#DOMAIN#/bitrix/sub/',
          'path_to_mobile_listener' => 'http://#DOMAIN#:8893/bitrix/sub/',
          'path_to_mobile_listener_secure' => 'https://#DOMAIN#:8894/bitrix/sub/',
          'path_to_websocket' => 'ws://#DOMAIN#/bitrix/subws/',
          'path_to_websocket_secure' => 'wss://#DOMAIN#/bitrix/subws/',
          'path_to_publish' => 'http://push-server-pub/bitrix/pub/',
          'nginx_version' => '4',
          'nginx_command_per_hit' => '100',
          'nginx' => 'Y',
          'nginx_headers' => 'N',
          'push' => 'Y',
          'websocket' => 'Y',
          'signature_key' => $_SERVER['REDIS_SERVER_SECRET'],
          'signature_algo' => 'sha1',
          'guest' => 'N',
      ],
  ],
];
