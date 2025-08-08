#syntax=docker/dockerfile:1.0

FROM python:alpine

WORKDIR /app

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
ENV FLASK_APP=app.py

CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0", "--port=5000"]
