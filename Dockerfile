FROM node:8.11.1-alpine

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# Image metadata
LABEL maintainers="SRE Team" version="1.0" \
    description="Docker image built to run Phoenix application in AWS Cloud"

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies 
COPY package*.json ./

RUN npm i \
    && npm cache clean --force

# Bundle app source
COPY --chown=node:node . .

# Expose port to access the app
EXPOSE 3000

USER node

# Run app
CMD [ "npm", "start" ]