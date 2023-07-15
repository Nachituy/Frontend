# Fetching the latest node image on alpine linux
FROM node:alpine AS build

# Declaring env
ENV NODE_ENV development
# Setting up the work directory
WORKDIR /react-app

COPY src src
COPY entrypoint.sh package.json webpack.config.js pnpm-lock.yaml ./

RUN yarn build
RUN pwd \
ls




FROM python:3.8-alpine

# Declaring env
#ENV NODE_ENV development
# Setting up the work directory
#WORKDIR /react-app
COPY --from=build /react-app/dist .
COPY --from=build /react-app/node_modules .

# Installing dependencies

ENV AWSCLI_VERSION='1.29.2'
RUN apk add py3-pip &&  pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION} 
# && yarn add -D webpack-cli && yarn build
RUN ls
ADD entrypoint.sh entrypoint.sh
RUN ls
RUN chmod ugo+x entrypoint.sh
RUN ls
ENTRYPOINT ["/bin/sh"]
CMD ["entrypoint.sh"] 

