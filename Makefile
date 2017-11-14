.PHONY: setup
setup:
	pip install -r ./supervisor-master.zip
	brew install haproxy

.PHONY: start
start:
	supervisord

.PHONY: stop
stop:
	supervisorctl stop all
	supervisorctl shutdown

.PHONY: ctl
ctl:
	supervisorctl -c supervisord.conf
