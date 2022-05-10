FROM python:3

ENV REPOSITORY /home/ec2-user/build
COPY app $REPOSITORY
RUN pip3 install -r $REPOSITORY/requirements.txt

EXPOSE 5000
ENV PY_FILE $REPOSITORY/waitress_server.py
CMD python3 $PY_FILE
