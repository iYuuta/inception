FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y redis-server

ENTRYPOINT ["redis-server", "--bind", "0.0.0.0", "--protected-mode", "no"]
