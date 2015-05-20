

# Step 1 - get dockerfile from github
git clone https://github.com/donskifarrell/docker-wordpress-nginx.git

# Step 2 - copy SSL certs into ssl/ directory
cp -r ssl/ docker-wordpress-nginx/

# Step 3 - go into dockerfile directory
cd docker-wordpress-nginx

# Step 3 - build dockerfile
sudo docker build -t="102somerton/102somerton-wordpress-nginx" .

# Step 2 - run docker to get images
sudo docker run -p 80:80 -p 443:443 --name 102somerton-wordpress-nginx --detach=true 102somerton/102somerton-wordpress-nginx --restart=always

# Step 3 - start docker container
sudo docker start 102somerton-wordpress-nginx


# Admin - run PHPMyAdmin
# docker run -d --link docker-wordpress-nginx:wp -p 49160:22 -p 49161:80 -p 49162:3306 --name admin --expose 49161 wnameless/mysql-phpmyadmin