include .env

CURRENT_UID = $(shell id -u)

wpplugin ?= $(shell bash -c 'read -p "Plugin: " plugin; echo $$plugin')
wppackage ?= $(shell bash -c 'read -p "Package: " package; echo $$package')

init:
	chmod +x -R ./cli;
	cd application && yarn install;
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash -c "composer install";
	cd application/wordpress/bedrock && cp .env.example .env;
	cd application/cypress && yarn install;

start:
	./cli/start;

stop:
	./cli/stop;

restart:
	./cli/restart;

run-container-node:
	docker run -it --rm -v `pwd`/application:/app -w /app -u $(CURRENT_UID) $(NODE_DOCKER_IMAGE) bash;

run-container-php:
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash;

add-wp-plugin:
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash -c "composer require wpackagist-plugin/$(wpplugin)";

add-wp-package:
	docker run -it --rm -v `pwd`/application/wordpress/bedrock:/app -w /app -u $(CURRENT_UID) $(PHP_DOCKER_IMAGE) bash -c "composer require $(wppackage)";

test-e2e-open:
	cd application/cypress && yarn cypress:open;

test-e2e-run:
	cd application/cypress && yarn cypress:run;

