FROM node:alpine AS build

# Declaring env
ENV NODE_ENV development
# Setting up the work directory
WORKDIR /react-app

# Installing dependencies
COPY src src

COPY ./package.json webpack.config.js pnpm-lock.yaml ./
RUN npm install 
RUN npm run build


FROM python:3.8-alpine

ENV AWSCLI_VERSION='1.29.2'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}
COPY --from=build build build
ADD entrypoint.sh /entrypoint.sh
RUN chmod ugo+x entrypoint.sh
ENTRYPOINT ["/bin/sh","/entrypoint.sh"]
