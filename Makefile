.phony: envrc install secretkey venv

envrc:
	echo DJANGO_SECRET_KEY=`make -s secretkey` > .envrc

install:
	pip install -r requirements.txt

migrate:
	python manage.py migrate

secretkey:
	python -c "import secrets; print(secrets.token_urlsafe())"

venv:
	basename `pwd` > .venv
	rm -rf ~/.virtualenvs/`cat .venv`
	python3 -m venv ~/.virtualenvs/`cat .venv`
