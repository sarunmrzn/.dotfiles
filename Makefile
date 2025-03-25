.PHONY: test test-setup test-cleanup test-all

# Test targets
test: test-setup test-run test-cleanup

test-setup:
	@echo "Setting up test environment..."
	@sudo ./tests/setup_test_env.sh setup

test-run:
	@echo "Running tests..."
	@./tests/test_install.sh

test-cleanup:
	@echo "Cleaning up test environment..."
	@sudo ./tests/setup_test_env.sh cleanup

test-all: test-setup test-run test-cleanup

# Development targets
lint:
	@echo "Running shellcheck..."
	@shellcheck install.sh tests/*.sh

# Installation targets
install:
	@echo "Running installation..."
	@sudo ./install.sh

install-phase2:
	@echo "Running phase 2 installation..."
	@./install.sh --phase2

# Cleanup targets
clean:
	@echo "Cleaning up..."
	@rm -f install.log
	@rm -rf backups/*

# Help target
help:
	@echo "Available targets:"
	@echo "  test        - Run all tests (setup, run, cleanup)"
	@echo "  test-setup  - Setup test environment"
	@echo "  test-run    - Run tests"
	@echo "  test-cleanup- Cleanup test environment"
	@echo "  test-all    - Run all tests"
	@echo "  lint        - Run shellcheck on scripts"
	@echo "  install     - Run installation"
	@echo "  install-phase2 - Run phase 2 installation"
	@echo "  clean       - Clean up temporary files"
	@echo "  help        - Show this help message" 