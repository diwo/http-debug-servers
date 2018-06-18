FROM debian:9.4

RUN apt-get update
RUN apt-get install -y netcat

WORKDIR /workspace
COPY *.sh /workspace/

CMD ./server.sh

