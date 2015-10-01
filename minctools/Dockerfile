
FROM ubuntu:12.04
MAINTAINER Yassine Benhajali <yanamarji@gmail.com>
RUN apt-get update
RUN apt-get dist-upgrade -y

RUN sudo apt-get install -y \
 build-essential \
 g++ \
 cmake \
 cmake-curses-gui \
 bison \
 flex \
 freeglut3 \
 freeglut3-dev \
 libxi6 \
 libxi-dev \
 libxmu6 \
 libxmu-dev \
 libxmu-headers

RUN cd
RUN git clone --recursive git://github.com/BIC-MNI/minc-toolkit.git /tmp/minc-toolkit
RUN cd /tmp/minc-toolkit
RUN git checkout develop
RUN mkdir build && cd build
RUN ccmake .. # Enter the location of all dependencies, if not detected automatically ...,
RUN make && make test && make install
