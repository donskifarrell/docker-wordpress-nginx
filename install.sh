

# Step 1 - get dockerfile from github
git clone https://github.com/donskifarrell/docker-wordpress-nginx.git

# Step 2 - run docker to get images
sudo docker run --publish=[80:80 | 443:443] --name 102somerton-wordpress-nginx --detach=true docker-wordpress-nginx --restart=always

# Step 3 - start docker container
sudo docker start docker-wordpress-nginx


# Admin - run PHPMyAdmin
# docker run -d --link docker-wordpress-nginx:wp -p 49160:22 -p 49161:80 -p 49162:3306 --name admin --expose 49161 wnameless/mysql-phpmyadmin