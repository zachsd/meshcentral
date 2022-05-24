if [[ -z ${SESSION_KEY} ]];then
    ${SESSION_KEY}=$(openssl rand -base64 32)
fi

cat << EOF > /app/meshcentral/meshcentral-data/config.json
{
  "$schema": "http://info.meshcentral.com/downloads/meshcentral-config-schema.json",
  "settings": {
    "cert": "${SERVER_FQDN}",
    "WANonly": ${WAN_ONLY},
    "sessionKey": "${SESSION_KEY}",
    "port": ${SERVER_PORT},
    "redirPort": ${SERVER_REDIRECT_PORT},
    "mongodb": "${MONGODB_CONNECTION_STRING}",
    "mongodbcol": "${MONGODB_COLLECTION_NAME}"
  },
  "domains": {
    "${DOMAIN_NAME}}": {
      "title": "${TITLE}",
      "title2": "${SUB_TITLE}",
      "minify": ${MINIFY},
      "newAccounts": false,
      "userNameIsEmail": ${USER_NAME_IS_EMAIL}
    }
  },
  "letsencrypt": {
    "email": "${LETS_ENCRYPT_EMAIL}",
    "names": ${LETS_ENCRYPT_NAMES},
    "rsaKeySize": ${LETS_ENCRYPT_KEY_SIZE},
    "production": ${LETS_ENCRYPT_PRODUCTION}
  }
}
EOF