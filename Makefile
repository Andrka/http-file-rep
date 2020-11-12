install:
	poetry install

req:
	poetry export -f requirements.txt > requirements.txt

lint:
	poetry run flake8 http_file_rep

test:
	poetry run pytest --cov=http_file_rep --cov-report xml tests/

check: lint test

run:
	bash -c "gunicorn --bind 0.0.0.0:8001 http_file_rep.wsgi:app --daemon""

stop:
	bash -c "kill -9 `ps aux |grep gunicorn |grep http_file_rep | awk '{ print $2 }'`"