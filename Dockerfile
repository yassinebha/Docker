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
# Install Octave
RUN apt-get update
RUN apt-get install octave -y
RUN apt-get install build-essential g++ cmake cmake-curses-gui bison flex freeglut3 freeglut3-dev libxi6 libxi-dev libxmu6 libxmu-dev libxmu-headers imagemagick libjpeg62 -y
RUN apt-get install "liboctave-dev" -y
RUN octave --eval "more off; pkg install -auto -global -forge -verbose control general signal image io statistics"

#Install MINC-toolkit
RUN apt-get install wget -y
RUN mkdir /home/niak
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.9.2-20140730-Ubuntu_14.04-x86_64.deb -P /home/niak
RUN dpkg -i /home/niak/minc-toolkit-1.9.2-20140730-Ubuntu_14.04-x86_64.deb
RUN rm /home/niak/minc-toolkit-1.9.2-20140730-Ubuntu_14.04-x86_64.deb

# Install PSOM
RUN apt-get install unzip
RUN mkdir -p /home/niak/build/SIMEXP/
RUN cd /home/niak/build/SIMEXP && wget http://www.nitrc.org/frs/download.php/7065/psom-1.0.2.zip
RUN cd /home/niak/build/SIMEXP && unzip psom-1.0.2.zip
RUN rm /home/niak/build/SIMEXP/psom-1.0.2.zip

# Install NIAK
RUN mkdir -p /home/niak/build/SIMEXP
RUN cd /home/niak/build/SIMEXP && wget https://github.com/SIMEXP/niak/archive/v0.12.20.zip
RUN cd /home/niak/build/SIMEXP && unzip v0.12.20.zip
RUN rm /home/niak/build/SIMEXP/v0.12.20.zip

# Install BCT
RUN mkdir -p /home/niak/build/SIMEXP
RUN cd /home/niak/build/SIMEXP && wget https://sites.google.com/site/bctnet/Home/functions/BCT.zip
RUN cd /home/niak/build/SIMEXP && unzip BCT.zip
RUN rm /home/niak/build/SIMEXP/BCT.zip

# Build octave configure file
RUN echo more off >> /etc/octave.conf
RUN echo save_default_options\(\'-7\'\)\; >> /etc/octave.conf
RUN echo graphics_toolkit gnuplot >> /etc/octave.conf
RUN echo addpath\(genpath\(\"/home/niak/build/SIMEXP/\"\)\)\; >> /etc/octave.conf
# Add the minc toolkit to the bash config
# for ubuntu 14.04
RUN touch /.bashrc
RUN echo source /opt/minc-itk4/minc-toolkit-config.sh >> /.bashrc
# docker build -t="pbellec/niak:v0.12.20u14.04" .
# docker run -i -t --name niak -v /home/pbellec/database:/database --user $UID:$GID pbellec/niak:v0.12.20u14.04 /bin/bash -c "source /.bashrc && octave"
#----------------------------------------------------------------------------------------------------------------
