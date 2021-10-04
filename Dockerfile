FROM registry.access.redhat.com/ubi8/nodejs-14:1-46

ENV VERDACCIO_APPDIR=/opt/verdaccio \
    VERDACCIO_PORT=4873 \
    VERDACCIO_PROTOCOL=http \
    NPM_CONFIG_PREFIX=/opt/app-root/src/.npm-global

USER 0

RUN mkdir -p /verdaccio /opt/app-root/src/.config/verdaccio \
    && chmod -R 777 /verdaccio /opt/app-root

ADD assets/verdaccio /verdaccio
ADD assets/config.yaml /verdaccio/config.yaml

RUN chmod +x /verdaccio/verdaccio

USER 1001

RUN npm install -g verdaccio \
  && npm link verdaccio

EXPOSE 8080

ENTRYPOINT ["/verdaccio/verdaccio", "--config", "/verdaccio/config.yaml", "--listen", "http://0.0.0.0:4873"]


#verdaccio --config /verdaccio/config.yaml --listen http://0.0.0.0:4873