FROM node:alpine AS development

# Declaring env
ENV NODE_ENV development
# Setting up the work directory
WORKDIR /react-app

# Installing dependencies
COPY . .
#COPY ./package.json /react-app
RUN yarn install

#npm install 

# Copying all the files in our project

EXPOSE 9000
# Starting our application
CMD yarn start