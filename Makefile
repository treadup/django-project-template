.phony: envrc install runserver secretkey venv

envrc:
	echo DJANGO_SECRET_KEY=`make -s secretkey` > .envrc

install:
	pip install -r requirements.txt

migrate:
	python manage.py migrate

runserver:
	python manage.py runserver

secretkey:
	python -c "import secrets; print(secrets.token_urlsafe())"

venv:
	basename `pwd` > .venv
	rm -rf ~/.virtualenvs/`cat .venv`
	python3 -m venv ~/.virtualenvs/`cat .venv`
