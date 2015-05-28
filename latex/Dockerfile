FROM ubuntu:14.04
MAINTAINER Yassine Benhajali <yanamarji@gmail.com>

RUN apt-get update && apt-get install -y texlive texlive-fonts-extra texlive-latex-extra

#install texstudio
RUN apt-get install -y wget
RUN wget http://download.opensuse.org/repositories/home:/jsundermeyer/xUbuntu_14.04/amd64/texstudio_2.9.4_amd64.deb -P /tmp/.

RUN dpkg -i /tmp/texstudio_2.9.4_amd64.deb
RUN rm /tmp/texstudio_2.9.4_amd64.deb
