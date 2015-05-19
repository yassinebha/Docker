#------------------------------------------------------------------------------------------------------
##########this part is from the image "ipython/notebook" the MAINTAINER is IPython Project <ipython-dev@scipy.org>
FROM ipython/ipython:3.x

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem
# $PASSWORD will get `unset` within notebook.sh, turned into an IPython style hash
ENV PASSWORD Dont make this your default
ENV USE_HTTP 0

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD ["/notebook.sh"]


##########this part is from the image "simexp/niak" the MAINTAINER Pierre Bellec <pierre.bellec@criugm.qc.ca>
RUN apt-get update
RUN apt-get dist-upgrade -y

# Install dependencies available through apt-get
RUN apt-get install -y \
  freeglut3 \
  imagemagick \
  libc6 \
  libexpat1 \
  libgl1-mesa-dev \
  libjpeg62 \
  libstdc++6 \
  libtiff4-dev \
  libuuid1 \
  libxau6 \
  libxcb1 \
  libxdmcp6 \
  libxext6 \
  libx11-6 \
  perl \
  wget 

#Install MINC-toolkit
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.9.3-20140830-Ubuntu_14.04-x86_64.deb -P /tmp
RUN dpkg -i /tmp/minc-toolkit-1.9.3-20140830-Ubuntu_14.04-x86_64.deb
RUN rm /tmp/minc-toolkit-1.9.3-20140830-Ubuntu_14.04-x86_64.deb

# Update repository list
RUN apt-get update
RUN apt-get install python-software-properties -y
RUN apt-add-repository ppa:octave/stable -y
RUN apt-get update

# Install octave
RUN apt-get install -y \
  bison \
  build-essential \
  cmake \
  cmake-curses-gui \
  flex \  
  g++ \
  imagemagick \
  liboctave-dev=3.8.1-1ubuntu1 \
  libxi-dev \
  libxi6 \
  libxmu-dev \
  libxmu-headers \
  libxmu6 \  
  octave=3.8.1-1ubuntu1 \
  unzip
  
# Fetch Octave forge packages
RUN mkdir /home/octave
RUN wget http://sourceforge.net/projects/octave/files/Octave%20Forge%20Packages/Individual%20Package%20Releases/control-2.8.0.tar.gz -P /home/octave
RUN wget http://sourceforge.net/projects/octave/files/Octave%20Forge%20Packages/Individual%20Package%20Releases/general-1.3.4.tar.gz -P /home/octave
RUN wget http://sourceforge.net/projects/octave/files/Octave%20Forge%20Packages/Individual%20Package%20Releases/signal-1.3.0.tar.gz -P /home/octave
RUN wget http://sourceforge.net/projects/octave/files/Octave%20Forge%20Packages/Individual%20Package%20Releases/image-2.2.2.tar.gz -P /home/octave
RUN wget http://sourceforge.net/projects/octave/files/Octave%20Forge%20Packages/Individual%20Package%20Releases/io-2.0.2.tar.gz -P /home/octave
RUN wget http://sourceforge.net/projects/octave/files/Octave%20Forge%20Packages/Individual%20Package%20Releases/statistics-1.2.4.tar.gz -P /home/octave

# Install Octave forge packages
RUN octave --eval "cd /home/octave; \
                   more off; \
                   pkg install -auto -global -verbose \
                   control-2.8.0.tar.gz \
                   general-1.3.4.tar.gz \
                   signal-1.3.0.tar.gz \
                   image-2.2.2.tar.gz \
                   io-2.0.2.tar.gz \
                   statistics-1.2.4.tar.gz"
# Install mricron and libcanberra
RUN apt-get install mricron
RUN apt-get install libcanberra-gtk-module

# Build octave configure file
RUN echo more off >> /etc/octave.conf
RUN echo save_default_options\(\'-7\'\)\; >> /etc/octave.conf
RUN echo graphics_toolkit gnuplot >> /etc/octave.conf
# Install NIAK
RUN cd /home/ && wget https://github.com/SIMEXP/niak/archive/v0.13.0.zip && unzip v0.13.0.zip && rm v0.13.0.zip
RUN mv /home/niak-0.13.0 /home/niak

# Install PSOM
RUN cd /home/niak/extensions && wget http://www.nitrc.org/frs/download.php/7065/psom-1.0.2.zip && unzip psom-1.0.2.zip && rm psom-1.0.2.zip

# Install BCT
RUN cd /home/niak/extensions && wget https://sites.google.com/site/bctnet/Home/functions/BCT.zip && unzip BCT.zip && rm BCT.zip

# Build octave configure file
RUN echo addpath\(genpath\(\"/home/niak/\"\)\)\; >> /etc/octave.conf
#----------------------------------------------------------------------------------------------------------------
