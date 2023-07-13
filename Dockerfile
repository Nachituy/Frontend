FROM python:3.8-alpine

ENV AWSCLI_VERSION='1.18.14'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
RUN chmod ugo+x entrypoint.sh
ENTRYPOINT ["/bin/sh","/entrypoint.sh"]
