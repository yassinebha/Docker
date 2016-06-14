FROM simexp/niak_dependency:1.1

EXPOSE 8888

# Install NIAK with dependencies
RUN  cd /home/ &&  wget -qO- -O tmp.zip  https://github.com/SIMEXP/niak/archive/dev-0.14.0.zip && unzip tmp.zip && rm tmp.zip
RUN  mv /home/niak-dev-0.14.0 /home/niak

# Pip installation
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

# Jupyter install
RUN pip3 install notebook

# Octave_kernel install
RUN pip3 install octave_kernel
RUN python3 -m octave_kernel.install
RUN pip3 install ipywidgets


# Nilearn and other packages
RUN apt-get install sudo
RUN apt-get install python-dev
RUN pip3 install --upgrade matplotlib
RUN pip3 install --upgrade nibabel
RUN pip3 install --upgrade scipy
RUN pip3 install --upgrade plotly
RUN pip3 install --upgrade scikit-learn
RUN pip3 install --upgrade nilearn

# Pandas install
RUN apt-get install python-pandas


# Build octave configure file
RUN echo more off >> /etc/octave.conf
RUN echo save_default_options\(\'-7\'\)\; >> /etc/octave.conf
RUN echo graphics_toolkit gnuplot >> /etc/octave.conf

# Build niak automated path generation in octave
RUN echo addpath\(genpath\(\"/home/niak/\"\)\)\; >> /etc/octave.conf

# start jupyter then head to the adress http://localhost:8888/
RUN mkdir /home/niak/tutorial
WORKDIR /home/niak/tutorial
CMD ["jupyter notebook --no-browser --port 8888 --ip=*"]
