.DEFAULT_GOAL := help


.PHONY: refresh
refresh:
	@# Refresh src

	cd src && git pull
	git add src
	git commit -m 'Update presentations' src


.PHONY: help
help:
	@# Display usage.

	@unmake $(MAKEFILE_LIST)
