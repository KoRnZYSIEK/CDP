# DISCLAIMER: DO NOT RUN ON HOSTS WITH PORTS THAT CAN BE ACCESSIBLE FROM INTERNET. 
# THE DEMO IS NOT SECURE AND CAN BE EASILY HACKED ;)


# Running the demo
To run this demo you will need a Linux machine with:
* User UID 1000 and 200 not assigned to an user (they will be used by jenkins and nexus users)
* Open and free ports: 4444,5555,8081,8080,9000,9092,50000,10022,100023
* The most recent docker-engine (at the moment I write this - v1.12.5) and docker-compose versions installed.

Instructions - how to install Docker:

[Docker-engine]( https://docs.docker.com/engine/installation/)

[Docker-compose]( https://docs.docker.com/compose/install/)

To check if they are working enter:

`docker -v`

`docker-compose -v`

To start the demo clone the repository and run `start.sh` script. Wait for the docker containers to start. If you are running script for the first time, there is quite a lot of data to download. If you have a slower connection you may get a timeout error from docker hub. If it is the case, just rerun the script. Check if the following elements are running by entering following adressess in your internet browser:
  
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

The job in jenkins inside `Continuous Delivery Pipeline` will be created for the master branch and run.

# Checking the results
You can check the following adressess:

* `nexus YOUR_IP:8081`

Go to `Repositories -> Releases -> Browse Storage` and you will see the artifacts were uploaded to nexus repository

* `sonarqube YOUR_IP:9000`

You can check that 1 project was analyzed by clicking big 1 above `Projects Analyzed` you can browse it.

* `application YOUR_IP:18080`

You can check that the application is greeting you from spring boot.

* `jenkins YOUR_IP:8080`

Go to the jenkins job and hover over the last box. You can stop the application and save or skip saving the application docker image.

# Branches and JUnit tests
After the (hopefully) successful run you can check how the branch detection and the tests work. Go into the `./git/` path and create a new branch by running:

`git checkout -b BranchName`

Next edit the file:

`src/main/java/hello/HelloController.java`

Change the "Greetings from spring boot!" text to something else. This will make the junit test fail and the job should fail on `Build and JUnit test` stage.

Add the file by running following commands from `./git/` path:

`git add src/main/java/hello/HelloController.java`

`git commit`

`GIT_SSH='../git_wrapper.sh' git push origin BranchName`

The job in jenkins inside `Continuous Delivery Pipeline` will be created for `BranchName` branch and run. It should fail during `Build and JUnit test` stage. 

