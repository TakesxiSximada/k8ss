.DEFAULT_GOAL := help

.PHONY: refresh
refresh:
	@# Refresh src

	cd src && git checkout master && git pull
	git add src
	git commit -m 'Update TIL' src


.PHONY: help
help:
	@# Display usage.

	@unmake $(MAKEFILE_LIST)
