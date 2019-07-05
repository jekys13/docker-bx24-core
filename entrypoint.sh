#!/bin/bash
cd /home/bitrix/www

if [ -d /home/bitrix/www/bitrix ]
then
    echo "Bitrix core exists"
else
    if [ $FRESH_INSTALL == 'Y' ]
    then
        wget http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php
        cp /home/index.php /home/bitrix/www/index.php
    else
        echo 'Downloading bitrix core'
        swift -A https://auth.selcdn.ru -U $SELECTEL_USER -K $SELECTEL_PASSWORD download $SELECTEL_CONTAINER $PROJECT_NAME.tar.gz
        
        echo 'Extracting bitrix core data'
        tar xvzf $PROJECT_NAME.tar.gz

        cp /home/.settings_extra.php bitrix/.settings_extra.php

        cat /home/dbconn.php >> bitrix/php_interface/dbconn.php

        echo 'Applying MySQL dump'
        mysql --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=db --database=$MYSQL_DATABASE < bitrix/dump.sql

        chmod 755 bitrix/
        rm -rf $PROJECT_NAME.tar.gz
        rm -rf bitrix/dump.sql
    fi
fi
