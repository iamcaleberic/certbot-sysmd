### Cerbot services and timers

##### Renewal/Dry Run

** make sure the script files with `.sh` are executable run `chmod +x [filename]` if not

- To renew/dry run a renewal of your Lets Encrypt certificate confirm what web server you are running on either `nginx` or `apache`
	- For Apache run:  
			`./certbot-apache.sh` or
			`bash certbot-apache.sh`
	- For Nginx run :
			`./certbot-nginx.sh` or
			`bash certbot-nginx.sh`


##### Systemd Service/Timers

- The timers are currently set to renew after 2m 3w you can configure this to your preference by editing `certbot.timer` or the equivalent for standalone

- To enable the systemd/timers and services run:(I intentinally refused to run scripts as priviledged by default to make sure guys are sure about what they are doing)
	  `sudo ./certbot-service.sh`
- The script will copy a service file and a correspoding timer file to systemd path (where all your unit files are located)
