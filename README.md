# DISCLAIMER: DO NOT RUN ON HOSTS THAT PORTS CAN BE ACCESSIBLE FROM INTERNET. 
# THE DEMO IS NOT SECURE AND CAN BE EASILY HACKED ;)

To run this demo you will need to have most recent docker-engine and docker-compose versions installed on a Linux machine. Instructions:

[Docker-engine]( https://docs.docker.com/engine/installation/)

[Docker-compose]( https://docs.docker.com/compose/install/)

To check if they are working enter:

`docker -v`

`docker-compose -v`

After you have those two, clone the repository and run `start.sh` script

Wait for the docker containers to start. Check the following elements are running by entering in browser:
  
* `jenkins YOUR_IP:8080`
* `nexus YOUR_IP:8081`
* `sonarqube YOUR_IP:9000`
* `selenium YOUR_IP:4444`

You can see that jenkins has a multibranch-project named `Continuous Delivery Pipeline` created and the sonarqube and nexus are empty. 

One of the ways to start the job is by commiting something to git repository. You can find local repository cloned into ./git/ Edit the selenium tests:

`./git/selenium/src/test/java/selenium/FirefoxSeleniumTest.java`
`./git/selenium/src/test/java/selenium/ChromeSeleniumTest.java`

by changing the IP address to your machine IP in line 29 (leave the port 18080):

 `driver.get("http://192.168.56.100:18080");`

To push the changes from ./git/ path run (you need the GIT_SSH wrapper to get the proper ssh key):

`GIT_SSH='../git_wrapper.sh' git clone ssh://root@<YOUR IP>:10022/git/`

  The job in jenkins inside `Continuous Delivery Pipeline` for master branch will be created and run.
  
  
