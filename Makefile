SHELL := /bin/bash

INSTALL_DIR := install
STEPS_DIR := $(INSTALL_DIR)/steps
BIN_DIR := $(INSTALL_DIR)/bin

export PATH := $(BIN_DIR):$(PATH)

.PHONY: all install configure user services packages

all: install configure user

install: packages configure services

packages:
	@$(STEPS_DIR)/10-packages.sh

configure:
	@$(STEPS_DIR)/20-config-system.sh

services:
	@$(STEPS_DIR)/30-services.sh

user:
	@$(STEPS_DIR)/40-config-user.sh
