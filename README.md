# MeshCentral
---
## Environment Variables

### MeshCentral: Environment Variables
NAME | DEFAULT VALUE | Description
-|-|-
DOMAIN_NAME | mydomain.com | Your domain name
SERVER_PORT | 443 | The port to connect to MeshCentral with. (443 is recommended)
SERVER_REDIRECT_PORT | 80 | Connections over this port will be redirected to the main port.
SERVER_FQDN | `meshcentral.${DOMAIN_NAME}` | The FQDN of the server. You will need register this name in your dns server. 
SESSION_KEY |  | The key used to encrypt the data transfers between remote computers and this server
WAN_ONLY | true | Disables LAN features and is intended for cloud/public internet access. 
TITLE | `${DOMAIN_NAME}` | The title that will be displayed at the login screen
SUB_TITLE | MeshCentral | The subtitle that will be displayed at the login screen
MINIFY | true | Optionally minify the websites content for faster loading. (Recommended for cloud deployments)
USER_NAME_IS_EMAIL | false | When true, users are registers and will have to login with their email address. 

### MongoDB: Environment Variables
NAME | DEFAULT VALUE | Description
-|-|-
MONGODB_SERVER | mongo | The IP for FQDN of the remote MongoDB server. 
MONGODB_PORT | 27017 | The port to connect to the remote MongoDB server. 
MONGODB_COLLECTION_NAME | meshcentral | The collection name for the MeshCentral database in the remote MongoDB server. 
MONGODB_USERNAME | admin | The MongoDB username
MONGODB_PASSWORD |  | The MongoDB Password
MONGODB_CONNECTION_STRING | `"mongodb://$ {MONGODB_USERNAME}:${MONGODB_PASSWORD}@$ {MONGODB_SERVER}:${MONGODB_PORT}/$ {MONGODB_COLLECTION_NAME}"` | The connection string used to authenticate with the remote MongoDB server. 

### Lest Encrypt: Environment Variables
NAME | DEFAULT VALUE | Description
-|-|-
LETS_ENCRYPT_EMAIL | `admin@${DOMAIN_NAME}` | LETS_ENCRYPT_EMAIL
LETS_ENCRYPT_NAMES | `${SERVER_FQDN}` | LETS_ENCRYPT_NAMES
LETS_ENCRYPT_KEY_SIZE | 3072 | LETS_ENCRYPT_KEY_SIZE
LETS_ENCRYPT_PRODUCTION | true | LETS_ENCRYPT_PRODUCTION