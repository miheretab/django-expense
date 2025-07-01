# Use official Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project files
COPY . /app/

# Collect static files (optional for production)
RUN python manage.py collectstatic --noinput

# Run migrations (optional: do this via entrypoint or separate command)
# RUN python manage.py migrate

# Default command: run gunicorn server
CMD ["gunicorn", "djangoExpenses.wsgi:application", "--bind", "0.0.0.0:8000"]