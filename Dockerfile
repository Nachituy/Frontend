FROM python:3.8-alpine
ENV AWSCLI_VERSION='1.29.2'
RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION} 
RUN pwd \
ls
ADD dist /dist
ADD entrypoint.sh /entrypoint.sh
RUN chmod ugo+x /entrypoint.sh
RUN ls
ENTRYPOINT ["/entrypoint.sh"]

