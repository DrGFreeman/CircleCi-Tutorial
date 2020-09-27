TEST_PATH = ./tests
VENV_NAME = venv
activate = . venv/bin/activate

.PHONY: venv
venv:
	@echo "███ Creating virtual environment..."
	@python3 -m venv $(VENV_NAME)

.PHONY: update-pip
update-pip:
	@echo "███ Updating pip..."
	@$(activate) && python -m pip install --upgrade pip

.PHONY: intall-dev-req
install-dev-req:
	@echo "███ Installing dev requirements..."
	@$(activate) && python -m pip install -r requirements-dev.txt

.PHONY: pre-commit-install
pre-commit-install: 
	@echo "███ Setting up githooks..."
	@$(activate) && pre-commit install

.PHONY: setup
setup: clean venv update-pip install-dev-req pre-commit-install test

.PHONY: install
install:
	@echo "███ Installing the package..."
	@$(activate) && python -m pip install .

.PHONY: clean
clean:
	@echo "███ Cleaning up..."
	@( \
		if [ -d venv ]; then \
		$(activate); \
		pre-commit clean; \
		pre-commit uninstall; \
		rm -rf venv; fi \
	)

.PHONY: lint
lint:
	@echo "███ Linting codebase..."
	@( \
		$(activate); \
		pre-commit run --all-files || true\
	)

.PHONY: test
test: lint
	@echo "███ Running unit tests..."
	@$(activate) && python -m pytest $(TEST_PATH) -v --cov || true
