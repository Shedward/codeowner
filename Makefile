PRODUCT_NAME=codeowner
PRODUCT_VERSION=1.0.1

SOURCE_SCRIPT_PATH=bin/codeowner
SOURCE_SERVICE_PATH=Services/codeowner.workflow

PREFIX?=/usr/local
BIN_PATH=$(PREFIX)/bin
DEST_SCRIPT_PATH=$(BIN_PATH)/$(PRODUCT_NAME)
DEST_SERVICE_PATH=$(HOME)/Library/Workflows/$(PRODUCT_NAME).workflow

.PHONY: version install uninstall

version:
	@echo $(PRODUCT_VERSION)

install:
	mkdir -p $(BIN_PATH)
	mkdir -p $(HOME)/Library/Workflows
	cp -f $(SOURCE_SCRIPT_PATH) $(DEST_SCRIPT_PATH)
	cp -rf $(SOURCE_SERVICE_PATH) $(DEST_SERVICE_PATH)
	chmod +x $(DEST_SCRIPT_PATH)

uninstall:
	rm -f $(DEST_SCRIPT_PATH)
	rm -rf $(DEST_SERVICE_PATH)
