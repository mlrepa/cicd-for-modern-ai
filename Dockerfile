# Modern Dockerfile for CI/CD examples for modern AI & ML projects using uv
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies and uv
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.cargo/bin:$PATH"

# Copy pyproject.toml first for better caching
COPY pyproject.toml .

# Install dependencies using uv
RUN uv pip install --system -e .

# Copy application code
COPY . .

# Default command
CMD ["python", "-c", "print('Modern AI & ML CI/CD container with uv is ready!')"] 
