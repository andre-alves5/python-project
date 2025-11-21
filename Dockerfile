# Using a specific digest ensures the base image is immutable.
FROM python:3.12-slim@sha256:b1a37c52701e47e8f547196023a1a3a41180b330e70e30954b039474744f603c AS builder

WORKDIR /app

COPY app/requirements.txt .

# Install dependencies into a target directory
RUN pip install --no-cache-dir --target=/app/packages -r requirements.txt

# --- Final Stage ---
# Switch back to the slim image to get access to shell and curl for the HEALTHCHECK
FROM python:3.12-slim@sha256:b1a37c52701e47e8f547196023a1a3a41180b330e70e30954b039474744f603c

WORKDIR /app

# Install curl, copy packages and app code
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/packages /usr/local/lib/python3.12/site-packages
COPY app/ .

# Create a non-root user and switch to it
RUN useradd --create-home appuser
USER appuser

EXPOSE 8080

# Add a health check to the container
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
