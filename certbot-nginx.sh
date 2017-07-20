#!/bin/bash
function new {
  sudo certbot --nginx
  if [ $? -eq 0 ]
  then
    echo "Obtained Certificate Successfully :)"
  else
    echo "Error while attempting to Obtain a new Certificate :("
  fi
}

function renew {
   sudo certbot renew --nginx
   if [ $? -eq 0 ]
   then
     echo "Certificate Renewal Successful:)"
   else
     echo "Error while attempting renewal :("
   fi
}

function test {
  sudo certbot renew --nginx --dry-run && sudo service nginx restart
  if [ $? -eq 0 ]
  then
   echo "Dry Run Successful :)"
  else
    echo "Error while running dry run :("
  fi
}

OPTIONS="Test New Renew Quit"
select opt in $OPTIONS; do
   if [ "$opt" = "Test" ]; then
	  echo Running dry run...
	  test
    echo Dry Run complete.
	  exit

  elif [ "$opt" = "New" ]; then
    echo Obtaining Certificate...
    new
    echo Certificate Obtaining complete.
    exit

  elif [ "$opt" = "Renew" ]; then
	  echo Renewing...
	  renew
	  echo Renewal complete.
	  exit

  elif [ "$opt" = "Quit" ]; then
    echo Goodbye.
	  exit
  else
	 clear
	 echo Bad option
  fi

done
