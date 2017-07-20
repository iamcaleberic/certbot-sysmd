#!/bin/bash

function apache_alone {
   cp certbot-apache-standalone.service /etc/systemd/system/certbot.service
   cp certbot.timer /etc/systemd/system/certbot.timer
  if [ $? -eq 0 ]
  then
     systemctl enable certbot.timer && systemctl start certbot.timer
    echo "Timer enabled to renew Certificate after 2 months 3 weeks :)"
  else
    echo "Service/Timer configuration failed :("
  fi

}

function nginx_alone {
   cp certbot-nginx-standalone.service /etc/systemd/system/certbot.service
   cp certbot.timer /etc/systemd/system/certbot.timer
  if [ $? -eq 0 ]
  then
     systemctl enable certbot.timer && systemctl start certbot.timer
    echo "Timer enabled to renew Certificate after 2 months 3 weeks :)"
  else
    echo "Service/Timer configuration failed :("
  fi
}

function apache {
   cp certbot-apache.service /etc/systemd/system/certbot.service
   cp certbot.timer /etc/systemd/system/certbot.timer
  if [ $? -eq 0 ]
  then
     systemctl enable certbot.timer && systemctl start certbot.timer
    echo "Timer enabled to renew Certificate after 2 months 3 weeks :)"
  else
    echo "Service/Timer configuration failed :("
  fi

}

function nginx {
   cp certbot-nginx.service /etc/systemd/system/certbot.service
   cp certbot.timer /etc/systemd/system/certbot.timer
  if [ $? -eq 0 ]
  then
     systemctl enable certbot.timer && systemctl start certbot.timer
    echo "Timer enabled to renew Certificate after 2 months 3 weeks :)"
  else
    echo "Service/Timer configuration failed :("
  fi
}

file="/etc/systemd/system/certbot.service"
if [ -e "$file" ];
  then
    echo Configuration files exist. You all good.
else

    OPTIONS="Apache Apache-standalone Nginx-standalone Nginx Quit"

    select opt in $OPTIONS; do
        if [ "$opt" = "Apache" ]; then
         echo Copying apache service file...
         apache
         echo Apache Timer/Service configuration complete.
         exit

       elif [ "$opt" = "Nginx" ]; then
         echo Copying nginx service file...
         nginx
         echo Nginx Timer/Service configuration complete.
         exit

       elif [ "$opt" = "Apache-standalone" ]; then
        echo Copying apache service file...
        apache_alone
        echo Apache Timer/Service configuration complete.
        exit

      elif [ "$opt" = "Nginx-standalone" ]; then
        echo Copying nginx service file...
        nginx_alone
        echo Nginx Timer/Service configuration complete.
        exit

       elif [ "$opt" = "Quit" ]; then
         echo Goodbye.
         exit
       else
        clear
        echo Bad option
       fi
    done
fi
