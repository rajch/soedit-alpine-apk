# soedit-alpine-apk
Alpine Linux APK packaging for the Sanos Text Editor

The Sanos Text Editor is a simple text-mode application that uses the same key bindings as most GUI text editors. It was written my Michael Ringguard. More details can be found [here](http://www.jbox.dk/sanos/editor.htm).

It has been packaged using autools in an upstream project called [soedit](https://github.com/rajch/soedit).

This project creates an Alpine Linux APK package using soedit as the base, also called soedit.

## Alpine repo
This GitHub repository also hosts an Alpine repo via GitHub Pages, signed and maintained by Raj Chaudhuri.

## Before Installing soedit
1. Add the key which was used to sign the repo to `/etc/apk/keys`. 
   ```bash
   $ sudo wget -O /etc/apk/keys/rajch@hotmail.com-5d6e57b2.rsa.pub \
      https://rajch.github.io/soedit-alpine-apk/rajch%40hotmail.com-5d6e57b2.rsa.pub
   ```
2. Update the `apk` package index:
   ```bash
   $ sudo apk update
   ```

You could also download and use a script which does the same things. Run:
```bash
$ wget -O - https://rajch.github.io/soedit-alpine-apk/init.sh | /bin/sh
```

## Installing soedit
Run:
```bash
$ sudo apk add soedit
```
To install the (very basic) manpage, you can run:
```bash
$ sudo apk add man soedit-doc
```
