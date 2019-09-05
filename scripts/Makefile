PUBLIC_KEY_FILENAME=""
REPO_URL=""

.PHONY: usage build-apk build-install-script clean-install-script clean-repo

usage:
	@echo
	@echo Set up build environment:
	@echo -------------------
	@echo Make sure you have a complete abuild environment, including a signing key pair.
	@echo One can be generated using abuild-keygen -a -i
	@echo This will store the keys in ~/.abuild, and copy the public part to /etc/apk/keys
	@echo Once done, invoke one of the following targets.
	@echo
	@echo Available targets:
	@echo ------------------
	@echo -  build-apk : Builds and signs the apk, and copies it to a repo in ../docs
	@echo -  build-install-script : Builds init.sh in ..docs. 
	@echo -  clean-apk : Removes the build apk from the repo in ..docs, but leaves the repo
	@echo -  clean-repo : Cleans out the repo at ../docs
	@echo
	@echo Current environment:
	@echo --------------------
	@echo abuild location: $$(which abuild)
	@echo PUBLIC_KEY_FILENAME: $(PUBLIC_KEY_FILENAME)
	@echo REPO_URL: $(REPO_URL)

build-apk:
	@export DESTDIR=$$(pwd)/../docs  && \
	cd ../main/soedit && \
	abuild -r -P $$DESTDIR && \
	echo Repo built. Now copy your public key from /etc/apt/keys to ../docs and run 'make build-install-script'|| \
	echo If the build failed, maybe you have not set up a key pair. Please type 'make usage'.

clean-apk:
	@export REPODEST=$$(pwd)/../docs && \
	cd ../main/soedit && \
	abuild clean && \
	abuild cleanpkg

build-install-script:
	@[ -z "$(PUBLIC_KEY_FILENAME)" ] && \
	  echo Please set PUBLIC_KEY_FILENAME \
	|| (\
	  [ -z "$(REPO_URL)" ] && \
	    echo Please set REPO_URL \
	  || ( \
		  cp ../templates/repo/init.sh ../docs/init.sh && \
		  sed -i "s/\%PLEASE_SET_FILE\%/$(PUBLIC_KEY_FILENAME)/g" ../docs/init.sh && \
		  sed -i "s/\%PLEASE_SET_REPO_URL\%/$(subst /,\/,$(REPO_URL))/g" ../docs/init.sh && \
		  echo Install script generated at ../docs/init.sh \
	  )	\
	)

clean-install-script:
	rm ../docs/init.sh

clean-repo:
	rm -r ../docs/*
