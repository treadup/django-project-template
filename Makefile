.phony: install secretkey venv

install:
	pip install -r requirements.txt

secretkey:
	python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'

venv:
	basename `pwd` > .venv
	rm -rf ~/.virtualenvs/`cat .venv`
	python3 -m venv ~/.virtualenvs/`cat .venv`
