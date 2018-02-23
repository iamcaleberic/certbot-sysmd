### Cerbot services & timers & scripts

##### Renewal and/or Dry Run of letsencrypt certificates

**Run with elevated priviledges where necessary**

**make sure the `script` files with `.sh` are executable**. If not, run:

```
 chmod +x [filename]
```

- To `renew` or `dry-run` a renewal of your Lets Encrypt certificate `confirm` what web server you are running on either `nginx` or `apache`. Run the following and follow the prompts
	- For Apache run:  
		```
			./certbot-apache.sh
		```
		or
	  ```
			bash certbot-apache.sh
		```
	- For Nginx run:
		```
			./certbot-nginx.sh
		```
		or
		```
			bash certbot-nginx.sh
		```

##### Systemd Service/Timers

- The `.timer` the timer runs `twice daily
` to check if the certificate is due for renewal

- The timers are currently set to check for renewal twice daily can configure this to your preference by editing
	```
		certbot.timer
	```
- To `install` and `enable` the systemd timers and services run the following and follow the prompts:(**I intentinally refused to run scripts as priviledged by default to make sure guys are sure about what they are doing**)
	```
		./certbot-systemd.sh
	```
- The script will copy a `.service` file and a correspoding `.timer` file to systemd path (where all your unit files are located). [Check the Arch Wiki on systemd](https://wiki.archlinux.org/index.php/Systemd)

- Confirm your timer has been set by running
	```
		sudo systemctl list-timers
	```

- Should give someting of the sort
```
NEXT                         LEFT          LAST                         PASSED       UNIT                         ACTIVATES
Tue 2018-02-20 01:00:00 UTC  31min left    Tue 2018-02-20 00:00:05 UTC  28min ago    certbot.timer                certbot.service
```

### Valid links

- [Cerbot](https://certbot.eff.org/)
- [letsencrypt](https://letsencrypt.org/)
