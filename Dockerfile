FROM registry.redhat.io/rhel8/python-38:latest

EXPOSE 8000 

ENV APP_ROOT=/opt/app-root

RUN pip3 install fastapi && pip3 install uvicorn

COPY main.py $APP_ROOT/

WORKDIR $APP_ROOT

RUN which uvicorn


#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
CMD ["uvicorn", "--app-dir=$APP_ROOT", "main:app", "--reload"]

