FROM python:3.8-slim-buster
WORKDIR/app3
COPY ..
RUN pip install-r requirements.txt
CMD ["python1","app1.py"]
