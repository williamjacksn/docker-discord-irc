FROM node:12.14.0-alpine3.10

USER node

# https://www.npmjs.com/package/discord-irc
ARG DISCORD_IRC_VERSION="2.8.0"

ENV NODE_ENV="production" \
    PATH="/home/node/.yarn/bin:${PATH}"

RUN /usr/local/bin/yarn global add "discord-irc@${DISCORD_IRC_VERSION}" \
 && /usr/local/bin/yarn cache clean

ENTRYPOINT ["/home/node/.yarn/bin/discord-irc", "--config", "/config/discord-irc.json"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-discord-irc" \
      org.opencontainers.image.version="${DISCORD_IRC_VERSION}"
