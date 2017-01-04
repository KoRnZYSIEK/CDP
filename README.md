# DISCLAIMER: DO NOT RUN ON HOSTS THAT PORTS CAN BE ACCESSIBLE FROM INTERNET. 
# THE DEMO IS NOT SECURE AND CAN BE EASILY HACKED ;)

To run this demo you will need:
* User UID 1000 and 200 not used (will be used by jenkins and nexus users)
* Have the most recent docker-engine (now - v1.12.5) and docker-compose versions installed on a Linux machine. Instructions:

[Docker-engine]( https://docs.docker.com/engine/installation/)

[Docker-compose]( https://docs.docker.com/compose/install/)

To check if they are working enter:

`docker -v`

`docker-compose -v`

To start the demo clone the repository and run `start.sh` script. Wait for the docker containers to start. If you are running script for the first time, there is quite a lot of data to download. If you have a slower connection you may get timeout errrors from docker hub. Just rerun the script if that happens. Check if the following elements are running by entering in browser:
  
* `jenkins YOUR_IP:8080`
* `nexus YOUR_IP:8081`
* `sonarqube YOUR_IP:9000`
* `selenium YOUR_IP:4444`

You can see that jenkins has a multibranch-project named `Continuous Delivery Pipeline` created, the sonarqube has no projects and nexus repositories are empty. 

One of the ways to start the job is by commiting something to git repository. You can find local repository cloned into ./git/ Edit the selenium tests:

`./git/selenium/src/test/java/selenium/FirefoxSeleniumTest.java`

`./git/selenium/src/test/java/selenium/ChromeSeleniumTest.java`

by changing the IP address to your machine IP in line 29 (leave the port 18080):

 `driver.get("http://192.168.56.100:18080");`

To push the changes from ./git/ path run: 

`git add *`

`git commit`

`GIT_SSH='../git_wrapper.sh' git push` (you need the GIT_SSH wrapper to get the proper ssh key to connect to repository)

The job in jenkins inside `Continuous Delivery Pipeline` will be created for master branch and run.

After the (hopefully) successful run you can check the branch detection. Go into the ./git/ path and run:


