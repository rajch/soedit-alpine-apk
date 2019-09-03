usage:
	@echo Available targets:
	@echo    build-apk   - Builds and signs the apk, and copies it to a repo in ../docs
	@echo    clean-repo  - Cleans out the repo at ../docs
	@echo
	@echo  You will need to provide an RSA private key file.


../main/private.key:
	@echo Please copy a valid RSA private key file to $$(pwd)../main/private.key && \
	exit 2

/etc/apk/keys/public.key: ../main/private.key
	@echo Adding public key to trusted list...
	sudo openssl rsa -in $^ -pubout -out $@

build-apk: /etc/apk/keys/public.key
	export DESTDIR=$$(pwd)/../docs  && \
	export PACKAGER_PRIVKEY=$$(pwd)/../main/private.key && \
	cd ../main/soedit && \
	  abuild -r -P $$DESTDIR

#clean-apk: /etc/apk/keys/public.key
#	export DESTDIR=$(pwd)/../docs && \
#	export PACKAGER_PRIVKEY=$$(pwd)/../main/private.key && \
#	cd ../main/soedit && \
#	  abuild clean && \
#	  abuild cleanpkg

clean-repo:
	rm -r ../docs/*
