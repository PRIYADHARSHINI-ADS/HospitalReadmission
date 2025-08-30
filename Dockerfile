# Use official Python runtime as base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies (optional)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Expose the port (Flask/FastAPI default is 5000, Django is 8000)
EXPOSE 5000

# Run the app (update this based on your framework)
# For Flask:
CMD ["python", "app.py"]

# For FastAPI:
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]

# For Django:
# CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
