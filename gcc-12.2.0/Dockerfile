FROM ubuntu:20.04
WORKDIR /work 
COPY gcc-12.2.0.tar.gz .
COPY install-gcc.sh ./install-gcc.sh
RUN chmod +x install-gcc.sh && ./install-gcc.sh
