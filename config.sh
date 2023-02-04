#!/bin/bash
if [ -n "$RELAY_URL" ]; then
  sed -i "s|^relay_url =.*|relay_url = \"$RELAY_URL\"|" config.toml
fi
if [ -n "$NAME" ]; then
  sed -i "s|^name =.*|name = \"$NAME\"|" config.toml
fi
if [ -n "$DESCRIPTION" ]; then
  sed -i "s|^description =.*|description = \"$DESCRIPTION\"|" config.toml
fi
if [ -n "$PUB_KEY" ]; then
  sed -i "s|^pubkey =.*|pubkey = \"$PUB_KEY\"|" config.toml
fi
if [ -n "$CONTACT" ]; then
  sed -i "s|^contact =.*|contact = \"$CONTACT\"|" config.toml
fi
chmod 0444 config.toml 
# Check if the changes were made successfully
if [ $? -eq 0 ]; then
  echo "Successfully changed the values in config.toml"
else
  echo "Failed to change the values in config.toml"
fi
 ./nostr-rs-relay --db ${APP_DATA}
