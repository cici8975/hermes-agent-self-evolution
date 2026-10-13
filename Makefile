.PHONY: help install test lint clean

help:
	@echo "install  - editable install with dev extras"
	@echo "test     - run the test suite"
	@echo "lint     - byte-compile all sources (syntax gate)"
	@echo "clean    - remove caches and build artifacts"

install:
	python -m pip install --upgrade pip
	pip install -e ".[dev]"

test:
	python -m pytest tests/ -q

lint:
	python -m compileall -q evolution generate_report.py

clean:
	rm -rf build dist *.egg-info .pytest_cache
	find . -name '__pycache__' -type d -prune -exec rm -rf {} +
