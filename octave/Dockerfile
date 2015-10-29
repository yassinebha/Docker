FROM yassinebha/minc-toolkit-dev
MAINTAINER Yassine Benhajali <yanamarji@gmail.com>

# Update repository list
RUN apt-get update
RUN apt-get install python-software-properties dpkg-dev -y
RUN apt-get update
RUN apt-get install --fix-missing

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
RUN apt-get install mricron -y
RUN apt-get install libcanberra-gtk-module -y
RUN apt-get update

# Build octave configure file
RUN echo more off >> /etc/octave.conf
RUN echo save_default_options\(\'-7\'\)\; >> /etc/octave.conf
RUN echo graphics_toolkit gnuplot >> /etc/octave.conf
