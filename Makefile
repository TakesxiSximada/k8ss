.DEFAULT_GOAL := help

.PHONY: deps
deps:
	@# Install dependencies.

	pip install -r ./supervisor-master.zip
	brew install haproxy
	go get github.com/moriyoshi/devproxy
	go get github.com/TakesxiSximada/unmake

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

.PHONY: apply
apply:
	@# Apply middlewares

	make redis
	make mysql


.PHONY: redis
redis:
	@# Apply redis

	cd redis && make apply


.PHONY: mysql
mysql:
	@# Apply mysql

	cd mysql && make apply


.PHONY: kube-local
kube-local:
	@# Start minikube.

	minikube start


.PHONY: help
help:
	@# Display usage.

	@unmake $(MAKEFILE_LIST)
