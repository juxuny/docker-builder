FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /work 
RUN apt-get update && apt-get install -y curl gcc g++ make tzdata git ruby-full gem ruby-dev python ack-grep build-essential cmake python3-dev libc6-dev gcc-multilib libmpc-dev
COPY gcc-11.3.0.tar.gz .
COPY install-gcc.sh ./install-gcc.sh
RUN chmod +x install-gcc.sh && ./install-gcc.sh
