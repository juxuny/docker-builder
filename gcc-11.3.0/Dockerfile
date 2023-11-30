FROM ubuntu:20.04
WORKDIR /work 
RUN apt-get update && apt-get install -y curl gcc g++ make
COPY gcc-11.3.0.tar.gz .
COPY install-gcc.sh ./install-gcc.sh
RUN chmod +x install-gcc.sh && ./install-gcc.sh
