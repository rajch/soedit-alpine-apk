#!/bin/sh
PUBLIC_KEY_FILENAME="rajch@hotmail.com-5d6e57b2.rsa.pub"
PUBLIC_KEY_URL="http://rajch.github.io/soedit-alpine-apk/${PUBLIC_KEY_FILENAME}"
PUBLIC_KEY_FILE="/etc/apk/keys/${PUBLIC_KEY_FILENAME}"
REPOSITORY_STRING="http://rajch.github.io/soedit-alpine-apk/main"

CUID=$(id -u)
SUDO=""

if [ $CUID -ne 0 ]; then
    SUDO="sudo"
fi


echo Downloading and installing public key [sudo]...
$SUDO wget -O $PUBLIC_KEY_FILE $PUBLIC_KEY_URL

if [ -f $PUBLIC_KEY_FILE ]; then
    grep $REPOSITORY_STRING /etc/apk/repositories >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo Adding repository entry [sudo]...
        echo $REPOSITORY_STRING | $SUDO tee -a /etc/apk/repositories
    fi

    $SUDO apk update
    if [ $? -eq 0 ]; then
        echo Repository is ready.
    fi
else
    echo Could not install public key. Stopping.
    exit 1
fi