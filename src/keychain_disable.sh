#!/usr/bin/env bash

# As Administrator, run in a terminal using: sudo bash keychain_disable.sh 

echo -ne '\n' | git credential-osxkeychain erase host=github.com protocol=https
printf "protocol=https\nhost=github.com\n" | git credential-osxkeychain erase

# attempt to remove fit credentials from being saved in keychain
git config --system --unset credential.helper

keychainDisabled=$(git config --system credential.helper)

if [ "$keychainDisabled" == "osxkeychain" ]; then
  echo "Keychain NOT disabled"
else
  echo "Keychain disabled"
fi