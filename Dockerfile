FROM alpine 

RUN apk add --no-cache bash \
    py2-pip \
    gcc \
    python2-dev \
    linux-headers \
    libc-dev \
    tar \
    gzip \
    mysql-client \
    wget

RUN pip install --upgrade pip
RUN pip install python-swiftclient python-keystoneclient

WORKDIR /home

COPY entrypoint.sh /usr/local/bin/
COPY .settings_extra.php /home
COPY index.php /home
COPY dbconn.php /home

RUN ln -s /usr/local/bin/entrypoint.sh / # backwards compat
RUN chmod 755 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["/bin/bash"]