FROM ubuntu:20.04
WORKDIR /work 
RUN apt-get update && apt-get install -y curl gcc g++ make tzdata git ruby-full gem ruby-dev python ack-grep build-essential cmake python3-dev
COPY gcc-10.4.0.tar.gz /open-source/
COPY install-gcc.sh ./install-gcc.sh
RUN chmod +x install-gcc.sh && ./install-gcc.sh
