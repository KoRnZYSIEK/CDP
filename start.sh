sed -i "s|<PATH_TO_KEY>|$(pwd)/id_rsa|" git_wrapper.sh
chown -R 1000:1000 ./volumes/jenkins
chown -R 200:200 ./volumes/nexus
chmod 600 ./volumes/jenkins/.ssh/id_rsa
chmod 600 id_rsa
docker-compose up -d
GIT_SSH='./git_wrapper.sh' git clone ssh://root@localhost:10022/git/
