FROM jenkins/jenkins:latest
USER root
RUN curl -fsSL https://get.docker.com/ | sh && usermod -aG docker jenkins
COPY --chown=jenkins:jenkins jenkins /var/jenkins_home
USER jenkins
