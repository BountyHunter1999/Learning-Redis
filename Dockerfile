FROM python:3.10.7-alpine3.16
WORKDIR /code
COPY requirements.txt /code
RUN pip install -r requirements.txt --no-cache-dir
# ENV FLASK_APP=client.py
COPY /applications/client/ /code
CMD ["python", "client.py"]