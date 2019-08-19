# bumpup version here.
VERSION := 1.0

CURDIR := $(shell pwd)

## Shortcuts
a: all

## Commands

.PHONY: all
all: clean deploy-trident setup-storageclass check-config delete-test-resource
	echo "Complete trident installation. You already have trident backends and default storageclass."

.PHONY: clean
clean:
	! $(CURDIR)/clean.sh

.PHONY: delete-test-resource
delete-test-resource:
	! $(CURDIR)/delete-test-resource.sh

.PHONY: deploy-trident
deploy-trident:
	! $(CURDIR)/quick-install.sh

.PHONY: setup-storageclass
setup-storageclass:
	! $(CURDIR)/setup-storageclass.sh

.PHONY: check-config
check-config:
	! $(CURDIR)/check-configuration.sh
