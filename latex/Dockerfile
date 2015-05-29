FROM ubuntu:14.04
MAINTAINER Yassine Benhajali <yanamarji@gmail.com>

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver 

RUN apt-get update && apt-get install -y texlive texlive-fonts-extra texlive-latex-extra

#install texstudio
RUN apt-get install -y \
    libpoppler-qt4-4 \
    libqt4-network  \
    libqt4-script \
    libqt4-xml \
    libqtcore4 \
    libqtgui4 \
    wget

RUN wget http://download.opensuse.org/repositories/home:/jsundermeyer/xUbuntu_14.04/amd64/texstudio_2.9.4_amd64.deb -P /tmp/.
RUN dpkg -i /tmp/texstudio_2.9.4_amd64.deb
RUN rm /tmp/texstudio_2.9.4_amd64.deb

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
# ENV HOME /home/developer

