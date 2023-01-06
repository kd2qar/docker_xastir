FROM debian:bullseye-slim

LABEL maintainer="KD2QAR@gmail.com"

RUN apt-get update;

#RUN apt-get install xastir
#RUN fail

RUN apt-get install -y  aptitude;

RUN apt-get install -y gzip m4 grep git
RUN apt-get install -y build-essential autoconf make automake bash binutils gcc cpp 
RUN apt-get install -y  libfreetype6-dev libmotif-dev  
#RUN apt-get install -y   ttf-xfree86-nonfree
RUN apt-get install -y  vim vim-common vim-runtime bash-completion
RUN apt-get install -y libax25-dev
#RUN apt-get install -y libasound2 libasound2-data libbluetooth3 libgps22;

#RUN apt-get install direwolf;

#RUN apt-get install -y aptitude
#RUN apt-get install -y build-essential gcc  gdb make texinfo 
#RUN apt-get install -y git gzip wget curl zip unzip tar vim vim-common vim-runtime 
#RUN apt-get install -y ca-certificates 
#RUN apt-get install -y sudo cmake libtool vim locate bash-completion

#RUN apt-get install -y git gcc g++ make cmake libasound2-dev libudev-dev

WORKDIR /root
RUN git clone https://github.com/Xastir/Xastir.git

RUN apt-get install -y libshp-dev libpcre3-dev
RUN apt-get install -y shapelib
RUN apt-get install -y libxpm-dev libxpm4
RUN apt-get install -y libmagic1 libmagick-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libdb-dev

RUN apt-get install -y libfreexl1

RUN apt-get install -y libx11-xcb1
RUN apt-get install -y libmagic-mgc
RUN apt-get install -y libgraphicsmagick-q16-3

#RUN aptitude search libgeos
#RUN fail
RUN apt-get install -y libgeos-dev 
#RUN apt-get install -y libgeos-3.5.1 ## Version for stretch
#RUN apt-get install -y libgeos-3.7.1 ## Version for buster

#RUN aptitude search libgeotiff
#RUN fail
RUN apt-get install -y libgeotiff-dev ## libgeotiff5

RUN apt-get install -y libtiff5 libgeos-c1v5
RUN apt-get install -y libproj-dev

#RUN aptitude search libgfortran
#RUN fail

#RUN apt-get install -y libgfortran3 ## Version for stretch
RUN apt-get install -y libgfortran5 ## Version for Buster
 
RUN apt-get install -y libgif7
#RUN apt-get install -y libexif12 libexif-dev
RUN apt-get install -y libtiff5-dev libtiff-dev
RUN apt-get install -y mime-support

#RUN aptitude search gda
#RUN fail
 
RUN apt-get install -y libgdal-dev gdal-data ##  libgdal20 ## gdal-data
RUN apt-get install -y liburiparser1 liburiparser-dev
RUN apt-get install -y libgeos++-dev


#RUN apt-get install xastir
#RUN fail

WORKDIR /root/Xastir
#RUN ls -lh
#RUN git checkout dev
RUN mkdir build
#WORKDIR /root/Xastir/build
WORKDIR /root/Xastir
RUN  ./bootstrap.sh

#run touch fff

RUN ./configure

#RUN fail

#WORKDIR /root/Xaster/build

RUN make 
#RUN ls -alh
#RUN make -j4
RUN make install
#RUN touch xxx
RUN make install-data
RUN grep install- Makefile
#RUN make install-MapData

RUN ln -s /usr/local/share/xastir/ /usr/share/

COPY xastirrun /

RUN chmod +x /xastirrun

ENTRYPOINT ["/xastirrun"]


