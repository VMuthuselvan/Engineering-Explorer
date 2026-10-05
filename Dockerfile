FROM python:3.11-slim

WORKDIR /app

# Copy application files
COPY index.html .
COPY logo/ ./logo/

# Create non-root user (addresses OpenShift UID security)
RUN useradd -m -u 1001 appuser && \
    chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

# Serve static files on port 8080
CMD ["python", "-m", "http.server", "8080", "--directory", "/app"]
