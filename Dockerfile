FROM python:3.11-slim

WORKDIR /app

COPY index.html .
COPY logo/ ./logo/

# Create non-root user with root group (GID 0) for OpenShift random UID compatibility
RUN useradd -m -u 1001 appuser && \
    chown -R 1001:0 /app && \
    chmod -R g+rwx /app

USER 1001

EXPOSE 8080

CMD ["python", "-m", "http.server", "8080", "--directory", "/app"]
