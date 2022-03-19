SHELL ?= /bin/bash
export VERSION ?= $(shell printf "`./version`${VERSION_SUFIX}")

# -------------------------------[ General Tools ]--------------------------------

.PHONY: help
help: ## List of available commands
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\033[36m\1\\033[m:\2/' | column -c2 -t -s :)"

.PHONY: submodules
submodules: ## Pull the submodules of the repo
	@git submodule update --init --recursive || printf "\nFailed to pull submodules\n"

.PHONY: version
version: ## Automatically calculate the semantic version based on the number of commits since the last change to the VERSION file
	@echo ${VERSION}

# ---------------------------------[ Code Tools ]---------------------------------

.PHONY: lint
lint: ## Lint the code in the directory
	@echo "TODO"
