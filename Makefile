SHELLCHECK_EXCLUDES := SC2012,SC2046,SC2086

.PHONY: default
default: help

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo
	@echo "Targets:"
	@echo "  lint         Run all linters"
	@echo "  lint-shellcheck Run shellcheck linter"
	@echo "  lint-yaml    Run YAML linter"
	@echo "  format       Run all formatters"
	@echo "  format-shellcheck Run shellcheck formatter"


.PHONY: lint
lint: lint-shellcheck lint-yaml

.PHONY: lint-shellcheck
lint-shellcheck:
	@if find . -type f -name "*.sh" | grep -q .; then \
		shellcheck -e $(SHELLCHECK_EXCLUDES) *.sh; \
	else \
		echo "No .sh files found - skipping shellcheck"; \
	fi

.PHONY: lint-yaml
lint-yaml:
	yamllint *.yml .github/workflows/*.yml

.PHONY: format
format: format-shellcheck

.PHONY: format-shellcheck
format-shellcheck:
	shellcheck -e $(SHELLCHECK_EXCLUDES) -f diff *.sh | git apply --allow-empty