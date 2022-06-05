############################
### MeshCentral Settings ###
############################

# Set the meshcentral session key
if [[ -z ${SESSION_KEY} ]]; then
  echo "No session key set, generating random key."
  SESSION_KEY=$(openssl rand -base64 32)
  echo "Random Session Key: [ ${SESSION_KEY} ]"
fi

# Set the server title to the domain name
if [[ -z ${TITLE} ]]; then
  TITLE=$DOMAIN_NAME
fi

# Set the server title to the domain name
if [[ -z ${DOMAIN_NAME} ]]; then
  DOMAIN_NAME="example.com"
fi

# Set server name
if [[ -z ${SERVER_NAME} ]]; then
  SERVER_NAME="meshcentral"
fi

# Set the server FQDN
if [[ -z ${SERVER_FQDN} ]]; then
  SERVER_FQDN="${SERVER_NAME}.${DOMAIN_NAME}"
fi

#############################
### Lets Encrypt Settings ###
#############################

# Set the lets encrypt email to admin@<domian_name>
if [[ -z ${LETS_ENCRYPT_EMAIL} ]]; then
  LETS_ENCRYPT_EMAIL="admin@${DOMAIN_NAME}"
fi

# Set the lets encrypt server names, to the fqdn of this server
if [[ -z ${LETS_ENCRYPT_NAMES} ]]; then
  LETS_ENCRYPT_NAMES=${SERVER_FQDN}
fi


# Build the main config.json file for meshcentral
cat <<EOF >/app/meshcentral/meshcentral-data/config.json
{
    "$schema": "http://info.meshcentral.com/downloads/meshcentral-config-schema.json",
    "settings": {
        "cert": "$SERVER_FQDN",
        "WANonly": $WAN_ONLY,
        "sessionKey": "$SESSION_KEY",
        "port": $SERVER_PORT,
        "redirPort": $SERVER_REDIRECT_PORT
    },
    "domains": {
        "$DOMAIN_NAME": {
            "title": "$TITLE",
            "title2": "$SUB_TITLE",
            "minify": $MINIFY,
            "newAccounts": false,
            "userNameIsEmail": $USER_NAME_IS_EMAIL
        }
    },
    "letsencrypt": {
        "email": "$LETS_ENCRYPT_EMAIL",
        "names": "$LETS_ENCRYPT_NAMES",
        "rsaKeySize": $LETS_ENCRYPT_KEY_SIZE,
        "production": $LETS_ENCRYPT_PRODUCTION
    }
}
EOF

cat /app/meshcentral/meshcentral-data/config.json

# Start the meshcentral application
node node_modules/meshcentral --cert ${LETS_ENCRYPT_NAMES}