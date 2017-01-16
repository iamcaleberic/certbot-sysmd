#!/bin/bash

LE=/opt/letsencrypt

function renew {
   cd $LE && ./certbot-auto renew 
}

function test {
  cd $LE && ./certbot-auto renew --dry-run
}

OPTIONS="Test Renew"
select opt in $OPTIONS; do
   if [ "$opt" = "Test" ]; then
	  echo Running dry run...
	  test	
	  exit

  elif [ "$opt" = "Renew" ]; then
	  echo Renewing
	  renew
	  echo Renewal complete
	  exit
	  					
  else	
	 clear
	 echo bad option
  fi

done
																									                 
