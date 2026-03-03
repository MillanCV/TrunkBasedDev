.PHONY: sync fmt lint test check

sync:
	uv sync --all-groups

fmt:
	uv run ruff format .

lint:
	uv run ruff check . --fix

test:
	uv run pytest

check: fmt lint test
