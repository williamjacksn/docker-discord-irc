FROM node:10.14.2-alpine

USER node

ENV NODE_ENV production
ENV NPM_CONFIG_PREFIX /home/node/.npm-global

RUN /usr/local/bin/npm install --global --production discord-irc@2.6.2 \
 && /usr/local/bin/npm cache clean --force

ENTRYPOINT ["/home/node/.npm-global/bin/discord-irc", "--config", "/config/discord-irc.json"]

LABEL maintainer=william@subtlecoolness.com \
      org.label-schema.schema-version=1.0 \
      org.label-schema.version=2.6.2
