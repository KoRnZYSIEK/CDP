FROM ubuntu:14.04

#Install ssh / curl
RUN apt-get -y update && \
apt-get -y install openssh-server curl

# Setting openssh
RUN mkdir -p  /var/run/sshd /root/.ssh && \
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config 

# Clearing and setting authorized ssh keys
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ0m1DRw7fbkm10VNxUfHi64WHhjGvX8CAX5+Ei5G6rW/dMQNLwHp/q16oIpoFSVHDMxIPTNUtoObHRJXLaZQC5I1V01vBigXnOwTtoCdkAyWiLyFZPe7HPt2UE0PPiZ8YG1b6+hgyKhnz/N30hTrYESC3nNGk1B6OKpJxWRJa4bbkWz9ClnrbyiWYm0JW47IyVpOoFVfEI47DSfvhrUeJ688jk3p/UlVNZr2CuVxTnX8Eks7BUt6Ti6B/D9ribXerFNMtfgcHlSmicrsiKr24Rt7MpyLYsEger5axkMAZioS897Zco8Z/oMCRJHzylLf/RQwIajs8WNg7SKhwDxDZ email@example.com' >> /root/.ssh/authorized_keys

#Install docker
RUN curl -fsSL https://get.docker.com/ | sh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

