usage:
	@echo
	@echo Set up environment:
	@echo   Make sure you have a complete abuild environment, including a signing key pair.
	@echo   One can be generated using abuild-keygen -a -i
	@echo   This will store the keys in ~/.abuild, and copy the public part to /etc/apk/keys
	@echo   Once done, invoke one of the following targets.
	@echo
	@echo Available targets:
	@echo    build-apk   - Builds and signs the apk, and copies it to a repo in ../docs
	@echo    clean-apk   - Removes the build apk from the repo in ..docs, but leaves the repo
	@echo    clean-repo  - Cleans out the repo at ../docs
	@echo

#../main/private.key:
#	@echo Please copy a valid RSA private key file to $$(pwd)../main/private.key && \
#	exit 2

#/etc/apk/keys/public.key: ../main/private.key
#	@echo Adding public key to trusted list...
#	sudo openssl rsa -in $^ -pubout -out $@

build-apk:
	export DESTDIR=$$(pwd)/../docs  && \
	cd ../main/soedit && \
	  abuild -r -P $$DESTDIR && \
	  echo Now copy your public key from /etc/apt/keys to ../docs || \
	  echo If the build failed, maybe you have not set up a key pair. Please type 'make usage'.

clean-apk:
	export REPODEST=$$(pwd)/../docs && \
	cd ../main/soedit && \
	  abuild clean && \
	  abuild cleanpkg

clean-repo:
	rm -r ../docs/*
