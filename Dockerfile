FROM node:lts-buster

ENV DOMAIN_NAME=
ENV SERVER_PORT=443
ENV SERVER_REDIRECT_PORT=80
ENV SERVER_NAME=
ENV SERVER_FQDN=

ENV SESSION_KEY=
ENV WAN_ONLY=false
ENV TITLE=
ENV SUB_TITLE="MeshCentral"
ENV MINIFY=true
ENV USER_NAME_IS_EMAIL=false

ENV LETS_ENCRYPT_EMAIL=
ENV LETS_ENCRYPT_NAMES=
ENV LETS_ENCRYPT_KEY_SIZE=3072
ENV LETS_ENCRYPT_PRODUCTION=false

EXPOSE ${SERVER_PORT}/tcp
EXPOSE ${SERVER_REDIRECT_PORT}/tcp
EXPOSE 4433/tcp

RUN mkdir -p /app/meshcentral

COPY ./docker-entrypoint.sh /app/meshcentral/

RUN chmod 700 /app/meshcentral/docker-entrypoint.sh

WORKDIR /app/meshcentral

RUN npm install meshcentral

VOLUME [ "/app/meshcentral/meshcentral-backup","/app/meshcentral/meshcentral-data","/app/meshcentral/meshcentral-files" ]

ENTRYPOINT [ "/bin/bash", "-c", "./docker-entrypoint.sh" ] 