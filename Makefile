.PHONY: setup test typecheck unit-test dev

setup: .venv
.venv: requirements.txt
	python3 -m venv .venv
	.venv/bin/pip install -r requirements.txt
	# reset timestamp
	touch .venv

test: typecheck unit-test

typecheck: .venv
	.venv/bin/mypy --strict sakura.py

unit-test:
	# Unit tests not implemented

dev: .venv
	.venv/bin/uvicorn --reload sakura:app

# Technically, depends on .venv, but if you are calling this you probably don't want to run pip
# install -r requirements.txt first.
update-reqs:
	.venv/bin/pip freeze > requirements.txt
