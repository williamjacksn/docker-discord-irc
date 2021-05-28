FROM node:14.17.0-alpine3.13

USER node

ENV NODE_ENV="production" \
    PATH="/home/node/docker-discord-irc/node_modules/.bin:${PATH}"

COPY --chown=node:node package.json /home/node/docker-discord-irc/package.json

WORKDIR /home/node/docker-discord-irc
RUN /usr/local/bin/yarn \
 && /usr/local/bin/yarn cache clean

ENTRYPOINT ["/home/node/docker-discord-irc/node_modules/.bin/discord-irc"]
CMD ["--config", "/config/discord-irc.json"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-discord-irc"
