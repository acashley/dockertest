FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Update OS packages
RUN apt-get update && apt-get upgrade
RUN uname -a && cat /etc/issue

# Install app dependencies
RUN git clone https://github.com/acashley/dockertest/ /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080
CMD [ "npm", "start" ]

