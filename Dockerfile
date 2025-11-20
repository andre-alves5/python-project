FROM python:3.12-slim AS builder

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM gcr.io/distroless/python3-debian12

WORKDIR /app

COPY --from=builder /install /usr/local
COPY app/ .

ENV PYTHONPATH=/usr/local/lib/python3.12/site-packages

USER nonroot

EXPOSE 8080

CMD ["-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
