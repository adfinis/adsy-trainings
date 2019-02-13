TRAINING_COMMONS=adsy-trainings-common.src
TRAINING_BUILDER=$(TRAINING_COMMONS)/training-builder.py
TRAINING_ARGS= --root=. --commons=$(TRAINING_COMMONS) --build-dir=build

.PHONY: all build index help training-%

all: help

help:  ## Display this help.
	@echo " Adfinis-Sygroup AG - Training Builder"
	@echo
	@echo " Build targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort -k 1,1 \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  * \033[36m%-6s\033[0m %s\n", $$1, $$2}'
	@echo
	@echo " Available training build targets:"
	@find -mindepth '1' -maxdepth '1' -type d \
	    -not -name 'skeleton' \
	    -not -name '.git' \
	    -not -name 'build' \
	    -not -name 'adsy-trainings-common.src' \
	    -printf '  * \033[36mtraining-%f\033[0m\n' \
	    | sort -k 1,1
	@echo

build: ## Build all trainings.
	$(TRAINING_BUILDER) $(TRAINING_ARGS) --ignore=skeleton

index: ## Build training index page.
	$(TRAINING_BUILDER) $(TRAINING_ARGS) --index-only

training-%: ## Build an individual training.
	$(TRAINING_BUILDER) $(TRAINING_ARGS) --only=$(subst training-,,$@)


