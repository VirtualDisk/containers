FROM ghcr.io/virtualdisk/git:v2.49.0 AS git
RUN git clone https://github.com/frcooper/ollama-exporter.git /git

# Use a lightweight Python base image
FROM docker.io/library/python:3.11-slim

# Set working directory
WORKDIR /app

# Copy required files
COPY --from=git /git/ollama_exporter.py .

# Install dependencies
RUN pip install fastapi uvicorn prometheus_client httpx

# Expose the metrics port
EXPOSE 8000

# Define runtime environment variable for Ollama host (can be overridden)
ENV OLLAMA_HOST="http://localhost:11434"

# Start the FastAPI app
CMD ["uvicorn", "ollama_exporter:app", "--host", "0.0.0.0", "--port", "8000"]
