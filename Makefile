.DEFAULT_GOAL := help

.PHONY: deps
deps:
	@# Install dependencies.

	pip install -r ./supervisor-master.zip
	brew install haproxy

.PHONY: start
start:
	@# Start all services.

	supervisord

.PHONY: stop
stop:
	@# Stop all services.

	supervisorctl stop all
	supervisorctl shutdown

.PHONY: ctl
ctl:
	@# Activate supervisorctl

	supervisorctl -c supervisord.conf

.PHONY: admin
admin:
	@# Open k8s dashboard

	minikube dashboard

.PHONY: redis
redis:
	@# Apply redis

	cd redis && make apply


.PHONY: mysql
mysql:
	@# Apply mysql

	cd mysql && make apply


.PHONY: help
help:
	@# Display usage.

	@unmake $(MAKEFILE_LIST)
