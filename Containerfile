FROM registry.redhat.io/rhel8/python-38:latest

EXPOSE 8080

#ENV APP_ROOT=/opt/app-root

RUN pip3 install fastapi uvicorn

COPY ./app /opt/app-root/app

#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]

CMD ["uvicorn", "--app-dir=/opt/app-root", "app.main:app", "--reload", "--host", "0.0.0.0", "--port", "8080"]

