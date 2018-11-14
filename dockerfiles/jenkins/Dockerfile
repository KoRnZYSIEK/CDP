FROM jenkins/jenkins:latest
USER root
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
COPY --chown=jenkins ./jenkins /var/jenkins_home
RUN chmod 600 var/jenkins_home/.ssh/id_rsa
USER jenkins
