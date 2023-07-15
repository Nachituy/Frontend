# Fetching the latest node image on alpine linux
#FROM node:alpine AS build

# Declaring env
#ENV NODE_ENV development
# Setting up the work directory
#WORKDIR /react-app

#COPY src src
#COPY package.json webpack.config.js pnpm-lock.yaml ./

#RUN yarn add -D webpack-cli && yarn build
#RUN pwd \
#ls

FROM python:3.8-alpine

# Declaring env
#ENV NODE_ENV development
# Setting up the work directory


#COPY --from=build /react-app/dist /mybucket/dist
#COPY --from=build /react-app/node_modules /mybucket/node_modules

# Installing dependencies

ENV AWSCLI_VERSION='1.29.2'
RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION} 
RUN pwd \
ls
ADD entrypoint.sh /entrypoint.sh
RUN chmod ugo+x /entrypoint.sh
RUN ls
ENTRYPOINT ["/entrypoint.sh"]

