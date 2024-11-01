FROM python:3.8-slim

WORKDIR /app
COPY src/ /app/
COPY requirements.txt /app/

RUN pip install -r requirements.txt

EXPOSE 80
CMD ["python", "dashboard.py"]