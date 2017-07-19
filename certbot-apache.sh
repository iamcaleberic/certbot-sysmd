#bin/bash

function renew {
   sudo certbot renew --apache
   if [ $? -eq 0 ]
   then
     echo "Certificate Renewal Complete :)"
   else
     echo "Error while attempting renewal :("
   fi
}

function test {
  sudo certbot renew --apache --dry-run && sudo service apache2 restart
  if [ $? -eq 0 ]
  then
   echo "Dry Run Complete :)"
  else
    echo "Error while running dry run :("
  fi
}

OPTIONS="Test Renew Quit"
select opt in $OPTIONS; do
   if [ "$opt" = "Test" ]; then
	  echo Running dry run...
	  test
    echo Dry Run complete.
	  exit

  elif [ "$opt" = "Renew" ]; then
	  echo Renewing...
	  renew
	  echo Renewal complete.
	  exit

  elif [ "$opt" = "Quit" ]; then
	  exit
  else
	 clear
	 echo Bad option
  fi

done
