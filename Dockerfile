FROM ubuntu:bionic
RUN \
        apt-get update && \
        apt-get install -y software-properties-common && \
        add-apt-repository ppa:bitcoin/bitcoin && \
        apt-get update && \
        apt-get install -y apt-utils && \
        apt-get install -y vim less python3 && \
        apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils && \
        apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev && \
	apt-get install -y libboost-program-options-dev libboost-test-dev libboost-thread-dev && \
        apt-get install -y libdb4.8-dev libdb4.8++-dev && \
        apt-get install -y libminiupnpc-dev && \
        apt-get install -y libzmq3-dev 
RUN mkdir /tesseract-core
COPY tesseract-core /tesseract-core
WORKDIR /tesseract-core
RUN ./autogen.sh
RUN ./configure --disable-tests --disable-bench --with-gui=no
RUN make
RUN make install
RUN strip /usr/local/bin/tesseract*
RUN rm -rf /tesseract-core
RUN mkdir /data
COPY tesseract.conf /data
COPY tc /usr/local/bin
WORKDIR /root
CMD ["tesseractd", "-datadir=/data", "-printtoconsole"]
