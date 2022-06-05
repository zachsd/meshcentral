# MeshCentral
###  The open source, multi-platform, self-hosted, feature packed web site for remote device management.
---
## Environment Variables

### MeshCentral: Environment Variables
NAME | DEFAULT VALUE | Description
-|-|-
DOMAIN_NAME | `example.com` | Your domain name
SERVER_PORT | `443` | The port to connect to MeshCentral with. (443 is recommended)
SERVER_REDIRECT_PORT | `80` | Connections over this port will be redirected to the main port.
SERVER_FQDN | `SERVER_NAME`+`DOMAIN_NAME` | The FQDN of the server. You will need register this name in your dns server. 
SESSION_KEY | Randomly Generated | The key used to encrypt the data transfers between remote computers and this server
WAN_ONLY | `false` | Disables LAN features and is intended for cloud/public internet access. 
TITLE | `DOMAIN_NAME` | The title that will be displayed at the login screen
SUB_TITLE | `MeshCentral` | The subtitle that will be displayed at the login screen
MINIFY | `true` | Optionally minify the websites content for faster loading. (Recommended for cloud deployments)
USER_NAME_IS_EMAIL | `false` | When true, users are registers and will have to login with their email address. 

### Lest Encrypt: Environment Variables
NAME | DEFAULT VALUE | Description
-|-|-
LETS_ENCRYPT_EMAIL | `admin@${DOMAIN_NAME}` | LETS_ENCRYPT_EMAIL
LETS_ENCRYPT_NAMES | `${SERVER_FQDN}` | LETS_ENCRYPT_NAMES
LETS_ENCRYPT_KEY_SIZE | `3072` | LETS_ENCRYPT_KEY_SIZE
LETS_ENCRYPT_PRODUCTION | `true` | LETS_ENCRYPT_PRODUCTION

### Compose
```yaml
services:
  meshcentral:
    image: versionz/meshcentral:latest
    environment:
      DOMAIN_NAME: example.com
      SERVER_NAME: remote
      TITLE: Example.com Remote Access
      SUB_TITLE: MeshCentral
      WAN_ONLY: true
    ports:
      - target: 80
        published: 80
        protocol: tcp
        mode: host
      - target: 443
        published: 443
        protocol: tcp
        mode: host
      - target: 4433
        published: 4433
        protocol: tcp
        mode: host
    volumes:
      - type: volume
        source: mesh-backup
        target: /app/meshcentral/meshcentral-backup
      - type: volume
        source: mesh-data
        target: /app/meshcentral/meshcentral-data
      - type: volume
        source: mesh-files
        target: /app/meshcentral/meshcentral-files

volumes:
  mesh-data:
  mesh-files:
  mesh-backup:
```