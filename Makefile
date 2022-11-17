include .env

CURRENT_UID = $(shell id -u)

wpplugin ?= $(shell bash -c 'read -p "Plugin: " plugin; echo $$plugin')
wppackage ?= $(shell bash -c 'read -p "Package: " package; echo $$package')

init:
	yarn install && chmod +x -R ./cli;
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash -c "composer install";
	cd application/wordpress/bedrock && cp .env.example .env;

start:
	./cli/start.js;

start-pull:
	./cli/start.js -p;

stop:
	./cli/stop.js;

restart:
	./cli/restart.js;

run-container-php:
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash;

add-wp-plugin:
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash -c "composer require wpackagist-plugin/$(wpplugin)";

add-wp-package:
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash -c "composer require $(wppackage)";

