#!/bin/bash
file="/etc/systemd/system/certbot.service"

function apache_alone {
  if [ $? -eq 0 ]
  then
    if [[ -e "$file"  ]]; then
      echo Configuration files exist. You all good.
    else
      echo "Copying apache service file..."
      cp lib/certbot.timer /etc/systemd/system/certbot.timer
      cp lib/certbot-apache-standalone.service /etc/systemd/system/certbot.service
      systemctl enable certbot.timer && systemctl start certbot.timer
      echo "Timer enabled to renew Certificate. Checks renewal twice daily! :)"
    fi
  else
    echo "Service/Timer configuration failed :("
  fi

}

function nginx_alone {
  if [ $? -eq 0 ]
  then
    if [[ -e "$file"  ]]; then
      echo Configuration files exist. You all good.
    else
     echo "Copying nginx service file...  "
     cp lib/certbot.timer /etc/systemd/system/certbot.timer
     cp lib/certbot-nginx-standalone.service /etc/systemd/system/certbot.service
     systemctl enable certbot.timer && systemctl start certbot.timer
     echo "Timer enabled to renew Certificate. Checks renewal twice daily! :)"
    fi
  else
    echo "Service/Timer configuration failed :("
  fi
}

function apache {
  if [ $? -eq 0 ]
  then
    if [[ -e "$file"  ]]; then
      echo Configuration files exist. You all good.
    else
     echo "Copying apache service file..."
     cp lib/certbot-apache.service /etc/systemd/system/certbot.service
     cp lib/certbot.timer /etc/systemd/system/certbot.timer
     systemctl enable certbot.timer && systemctl start certbot.timer
     echo "Timer enabled to renew Certificate. Checks renewal twice daily! :)"
    fi
  else
    echo "Service/Timer configuration failed :("
  fi

}

function nginx {
  if [ $? -eq 0 ]
  then
    if [[ -e "$file"  ]]; then
      echo Configuration files exist. You all good.
    else
      echo "Copying nginx service file..."
      cp lib/certbot-nginx.service /etc/systemd/system/certbot.service
      cp lib/certbot.timer /etc/systemd/system/certbot.timer
      systemctl enable certbot.timer && systemctl start certbot.timer
      echo "Timer enabled to renew Certificate. Checks renewal twice daily! :)"
    fi
  else
    echo "Service/Timer configuration failed :("
  fi
}


PS3="Please select your current webserver configuration:"
OPTIONS="Apache Apache-standalone Nginx-standalone Nginx Quit"
select opt in $OPTIONS; do
    if [ "$opt" = "Apache" ]; then
     apache
     echo Apache Timer/Service configuration complete.
     exit

   elif [ "$opt" = "Nginx" ]; then
     nginx
     echo Nginx Timer/Service configuration complete.
     exit

   elif [ "$opt" = "Apache-standalone" ]; then
    apache_alone
    echo Apache Timer/Service configuration complete.
    exit

  elif [ "$opt" = "Nginx-standalone" ]; then
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
