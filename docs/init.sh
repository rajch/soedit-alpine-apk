#!/bin/sh

PUBLIC_KEY_URL="http://rajch.github.io/soedit-alpine-apk/rajch%40hotmail.com-5d6e57b2.rsa.pub"
PUBLIC_KEY_FILE="/etc/apk/keys/rajch@hotmail.com-5d6e57b2.rsa.pub"
REPOSITORY_STRING="http://rajch.github.io/soedit-alpine-apk/main"

echo Downloading and installing public key [sudo]...
sudo wget -O $PUBLIC_KEY_FILE $PUBLIC_KEY_URL

if [ -f $PUBLIC_KEY_FILE ]; then
    grep $REPOSITORY_STRING /etc/apk/repositories >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo Adding repository entry [sudo]...
        sudo echo $REPOSITORY_STRING >> /etc/apk/repositories
    fi

    sudo apk update
    if [ $? -eq 0 ]; then
        echo Repository is ready.
    fi
else
    echo Could not install public key. Stopping.
    exit 1
fi