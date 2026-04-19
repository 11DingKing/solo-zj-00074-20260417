FROM node:14-alpine
WORKDIR /www 
COPY . /www
RUN npm install
