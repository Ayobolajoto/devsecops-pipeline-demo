# Using a more recent, patched version of Python
FROM python:3.11-slim-bookworm

# Add a non-root user for security (Best Practice)
RUN useradd -m appuser
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Switch to the non-root user
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]