FROM node:alpine AS build

# Declaring env
ENV NODE_ENV development
# Setting up the work directory
WORKDIR /react-app

# Installing dependencies
COPY src src

COPY ./package.json webpack.config.js pnpm-lock.yaml ./
RUN apk add --update npm && npm install && npm run build

ENV AWSCLI_VERSION='1.29.2'
RUN apk add py3-pip &&  pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}
COPY --from=build ./build build
ADD entrypoint.sh /entrypoint.sh
RUN chmod ugo+x entrypoint.sh
ENTRYPOINT ["/bin/sh","/entrypoint.sh"]
