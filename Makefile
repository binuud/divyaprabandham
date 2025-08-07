# Maintainer Binu Udayakumar <binu@dronasys.com>

APP_NAME ?= divyaprabandham
HUGO_IMAGE=cibuilds/hugo:0.148.2
BUILD_VER ?= a1.0.0


# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## build the website using hugo
	rm -rf ./src/dronasys/public/*
	docker run --rm -it -v ./src:/home/circleci/project $(HUGO_IMAGE) hugo build 

deploy: ## deploy project to cloudflare
	npx wrangler pages deploy ./src/public

nginxServe: build## testrun nginx server
	docker run --rm -it -p 9080:8080 -v ./src/public:/usr/share/nginx/html -v ./deployment/nginx/default.conf:/etc/nginx/conf.d/default.conf nginx:1.25.1-alpine-slim

run: ## run hugo server
	docker run --rm -it -v ./src:/home/circleci/project -p 1313:1313 $(HUGO_IMAGE) hugo server -s /home/circleci/project --bind 0.0.0.0	

runShell: ## run hugo shell
	docker run --rm -it -v ./src:/home/circleci/project -p 1313:1313 $(HUGO_IMAGE) bash
