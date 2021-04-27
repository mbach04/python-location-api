FROM rhel8/python-38:latest

EXPOSE 8000 

ENV APP_ROOT=/opt/app-root

RUN pip3 install fastapi && pip3 install uvicorn

COPY main.py $APP_ROOT/

WORKDIR $APP_ROOT

uvicorn main:app --reload
CMD ["uvicorn", "main:app", "--reload"]

