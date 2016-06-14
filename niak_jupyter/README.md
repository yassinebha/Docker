IPython in Docker
=================

### Instructions to set up Ipython notebook that runs octave 

*  Pull the image `docker pull yassinebha/niak_notebook:latest`
*  Create a shared folder in you home directory `mkdir $HOME/notebooks`
*  Run the image

```
docker run --name notebook_test -d -p 443:8888  -v $HOME/notebooks/:/notebooks  -e "PASSWORD=password" yassinebha/niak_notebook:latest
```
*  Head to your browser then type [https://localhost](https://localhost) then over pass warning message then type the password which is `password` in this case ( you can choose your own ).

*  On OSX and Windows, extra steps are required to find the address and the port that the container has been forwarded to. In a Boot2Docker shell, run: `boot2docker ip` This should return an address like 192.168.59.103. Next, find the port in the docker environment with: `docker port notebook_test 8888`. This should return a port like 0.0.0.0.:443.
 Port your browser to the resulting address and port; for example: [https://192.168.59.103:443](https://192.168.59.103:443).

*  Open a new ipython notebook then __choose  python 2 not 3 as kernel__
*  In the first cell put this code to start octave interfacing: 

```
from pymatbridge import Octave
octave = Octave()
octave.start()
%load_ext pymatbridge
```
*  Finally, in the begginig of each cell that will run octave code put the matlab magic command `%%matlab` like this :

```
%%matlab
sombrero
```
