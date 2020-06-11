# image from Docker hub
FROM node:14.4.0   


# creates a directory in the image

RUN mkdir -p /usr/src/app 

#where the whole app will be stored, and this will become our current directory.

WORKDIR /usr/src/app 

# copy package.json and package-lock.json into current directory

COPY package*.json ./  

# npm will look into package.json and install all the dependencies written in there and stores everything in node_modules folder

RUN npm install 

RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list


RUN apt-get update

RUN apt-get install -y mongodb-org

RUN systemctl enable mongod

RUN systemctl start mongod

# it will bundle the app source code in the docker image

COPY . . 

EXPOSE 8080


# start our dockerized server, similar to command  "node index"

CMD ["node", "index"] 