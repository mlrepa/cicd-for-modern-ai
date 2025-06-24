# Modern Dockerfile for CI/CD examples for modern AI & ML projects using uv
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv using the official installer and ensure it's working
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && ls -la /root/.local/bin/ \
    && /root/.local/bin/uv --version

# Add uv to PATH for subsequent commands
ENV PATH="/root/.local/bin:$PATH"

# Verify uv is accessible via PATH
RUN which uv && uv --version

# Copy pyproject.toml first for better caching
COPY pyproject.toml .

# Install dependencies using uv with proper pyproject.toml reference
RUN uv pip install --system --requirement pyproject.toml

# Copy application code
COPY . .

# Default command
CMD ["python", "-c", "print('Modern AI & ML CI/CD container with uv is ready!')"] 
