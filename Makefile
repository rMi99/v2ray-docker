# Makefile for managing V2Ray client

V2RAY_BIN ?= v2ray              # Path to V2Ray binary
CONFIG_FILE ?= client_config.json  # Path to the client config file
PID_FILE = v2ray.pid             # File to store the V2Ray process ID

.PHONY: start stop status

start:
	@echo "Starting V2Ray client..."
	@$(V2RAY_BIN) -config=$(CONFIG_FILE) & echo $$! > $(PID_FILE)
	@echo "V2Ray client started with PID $$(cat $(PID_FILE))"

stop:
	@echo "Stopping V2Ray client..."
	@if [ -f $(PID_FILE) ]; then \
		kill $$(cat $(PID_FILE)) && rm -f $(PID_FILE); \
		echo "V2Ray client stopped."; \
	else \
		echo "No running V2Ray client found."; \
	fi

status:
	@if [ -f $(PID_FILE) ]; then \
		echo "V2Ray client is running with PID $$(cat $(PID_FILE))"; \
	else \
		echo "V2Ray client is not running."; \
	fi
