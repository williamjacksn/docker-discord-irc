FROM node:10.16.0-alpine

USER node

ENV NODE_ENV="production" \
    NPM_CONFIG_PREFIX="/home/node/.npm-global"

RUN /usr/local/bin/npm install --global --production discord-irc@2.7.1 \
 && /usr/local/bin/npm cache clean --force

ENTRYPOINT ["/home/node/.npm-global/bin/discord-irc", "--config", "/config/discord-irc.json"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-discord-irc" \
      org.opencontainers.image.version=2.7.1
