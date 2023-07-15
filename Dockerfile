FROM node:alpine AS development

# Declaring env
ENV NODE_ENV development
# Setting up the work directory
WORKDIR /react-app
COPY . .

# Installing dependencies

ENV AWSCLI_VERSION='1.29.2'
RUN apk add py3-pip &&  pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION} &&\
yarn add -D webpack-cli && yarn build
RUN ls
ADD entrypoint.sh entrypoint.sh
RUN ls
RUN chmod ugo+x entrypoint.sh
RUN ls
ENTRYPOINT ["/bin/sh"]
CMD ["entrypoint.sh"] 

