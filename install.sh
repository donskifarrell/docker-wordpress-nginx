
####
# Install wordpress container
####

# Step 1 - get dockerfile from github
git clone https://github.com/donskifarrell/docker-wordpress-nginx.git

# Step 2 - copy SSL certs into ssl/ directory
cp -r ssl/ docker-wordpress-nginx/

# Step 3 - go into dockerfile directory
cd docker-wordpress-nginx

# Step 3 - build dockerfile
sudo docker build -t="102somerton/102somerton-wordpress-nginx" .

# Step 2 - run docker to get images
sudo docker run -p 80:80 -p 443:443 --name 102somerton-wordpress-nginx --detach=true --restart=always 102somerton/102somerton-wordpress-nginx 

# Step 3 - start docker container
sudo docker start 102somerton-wordpress-nginx

####
# Admin with PHPMyAdmin
####

# Step 1 - run PHPMyAdmin container
docker run -d --link 102somerton-wordpress-nginx:wp -p 49160:22 -p 49161:80 -p 49162:3306 --name admin --expose 49161 wnameless/mysql-phpmyadmin

# Step 2 - Get IP Address of wordpress conatiner
docker inspect --format '{{ .NetworkSettings.IPAddress }}' 102somerton-wordpress-nginx

# Step 3 - connect to admin terminal
docker exec -it admin bash

# Step 4 - set terminal
export TERM=xterm

# Step 5 - edit phpmyadmin config
# http://superuser.com/questions/746258/configuring-phpmyadmin-to-connect-to-remote-database
nano /etc/phpmyadmin/config.inc.phpmyadmin
# put in IP Address instead of dbserver variable

# Step 6 - exit shell and log into wordpress container and get root db password
exit
docker exec -it 102somerton-wordpress-nginx bash
export TERM=xterm
less mysql-root-pw.txt

# Step 7 - log into phpmyadmin portal
username: root
http://<ipaddress>:49162/phpmyadmin

# Step 8 - import sql file from dropbox


# Useful:
# Copy to container
# cd /tmp/somefiles
# tar -cv * | docker exec -i 102somerton-wordpress-nginx tar x -C /usr/share/nginx/www



