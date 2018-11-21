FROM node:10.13.0-alpine

USER node

ENV NPM_CONFIG_PREFIX /home/node/.npm-global

RUN /usr/local/bin/npm install --global discord-irc@2.6.2

ENTRYPOINT ["/home/node/.npm-global/bin/discord-irc", "--config", "/config/discord-irc.json"]

LABEL maintainer=william@subtlecoolness.com \
      org.label-schema.schema-version=1.0 \
      org.label-schema.version=0.0.1
