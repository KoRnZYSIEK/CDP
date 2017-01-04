# DISCLAIMER: DO NOT RUN ON HOSTS THAT PORTS CAN BE ACCESSIBLE FROM INTERNET. 
# THE DEMO IS NOT SECURE AND CAN BE EASILY HACKED ;)

To run this demo you will need:
* User UID 1000 and 200 not used (will be used by jenkins and nexus users)
* Open and free ports: 4444,5555,8081,8080,9000,9092,50000,10022,100023
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

After the (hopefully) successful run you can check the branch detection and how the tests work. Go into the `./git/` path and run:

`git checkout -b BranchName`

Next edit the file:

`src/main/java/hello/HelloController.java`

Change the "Greetings from spring boot!" text to something else. This will make the junit test pass, as they check the class behaviour, but will fail the selenium tests which check the final output.

Add the file by running following commands from `./git/` path:

`git add src/main/java/hello/HelloController.java`
`git commit`
`GIT_SSH='../git_wrapper.sh' git push --set-upstream origin BranchName`

The job in jenkins inside `Continuous Delivery Pipeline` will be created for BranchName branch and run. It should fail during the selenium tests. 

