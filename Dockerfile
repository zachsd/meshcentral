FROM node:lts-buster

ENV DOMAIN_NAME="mydomain.com"
ENV SERVER_PORT=443
ENV SERVER_REDIRECT_PORT=80
ENV SERVER_FQDN="meshcentral.mydomain.com"

ENV SESSION_KEY=""
ENV WAN_ONLY=true
ENV TITLE="${DOMAIN_NAME}"
ENV SUB_TITLE="MeshCentral"
ENV MINIFY=true
ENV USER_NAME_IS_EMAIL=false

ENV MONGODB_SERVER="mongo"
ENV MONGODB_PORT=27017
ENV MONGODB_COLLECTION_NAME="meshcentral"
ENV MONGODB_USERNAME='admin'
ENV MONGODB_PASSWORD=''
ENV MONGODB_CONNECTION_STRING="mongodb://${MONGODB_USERNAME}:${MONGODB_PASSWORD}@${MONGODB_SERVER}:${MONGODB_PORT}/${MONGODB_COLLECTION_NAME}"

ENV LETS_ENCRYPT_EMAIL="admin@${DOMAIN_NAME}"
ENV LETS_ENCRYPT_NAMES="${SERVER_FQDN}"
ENV LETS_ENCRYPT_KEY_SIZE=3072
ENV LETS_ENCRYPT_PRODUCTION=true

EXPOSE ${SERVER_PORT}/tcp
EXPOSE ${SERVER_REDIRECT_PORT}/tcp
EXPOSE 4433/tcp

RUN mkdir -p /app/meshcentral

COPY ./docker-entrypoint.sh .

WORKDIR /app/meshcentral

RUN npm install meshcentral

VOLUME [ "/app/meshcentral/meshcentral-backup","/app/meshcentral/meshcentral-data","/app/meshcentral/meshcentral-files" ]

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD ["node", "node_modules/meshcentral", "--cert", "${LETS_ENCRYPT_NAMES}"]