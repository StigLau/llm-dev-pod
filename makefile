.DEFAULT_GOAL := help

# Makefile for dev container
ENGINE ?= podman
IMAGE  ?= dev-env
NAME   ?= claude-env
#WORKDIR?= $(PWD)
WORKDIR?= /Users/stig.lau/utvikling/privat

.PHONY: build run shell start stop rm logs help

build: ## Build the image
	$(ENGINE) build -t $(IMAGE) .

run: ## Run interactively (auto-remove)
	$(ENGINE) run -it --rm -p 8080:8080 -p 3000:3000 -v $(WORKDIR):/workspace $(IMAGE)

shell: ## Exec into running container
	$(ENGINE) exec -it $(NAME) bash

start: ## Run in detached mode
	$(ENGINE) run -dit -p 8080:8080 -p 3000:3000 -v $(WORKDIR):/workspace --name $(NAME) $(IMAGE)

stop: ## Stop detached container
	-$(ENGINE) stop $(NAME)

rm: ## Remove detached container
	-$(ENGINE) rm $(NAME)

logs: ## Show container logs
	$(ENGINE) logs -f $(NAME)

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
