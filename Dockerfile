FROM python:3.13-slim

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN pip install poetry

RUN poetry config virtualenvs.create false \ 
    && poetry install --no-dev

COPY . .

EXPOSE 80

CMD [ "uvicorn", "fastapi-docker.main:app", "--host", "0.0.0.0", "--port", "80", "--reload" ]