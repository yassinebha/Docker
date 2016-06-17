Jupyter in Docker with NIAK
=================

### Instructions to set up Jupyter notebook for NIAK

*  Run this commad on a terminal:

```
docker run -it --privileged -d -p 8888:8888  --name niak_jupy -v /etc/shadow:/etc/shadow \
-v /etc/group:/etc/group -v /etc/passwd:/etc/passwd   -v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix$DISPLAY -v $HOME:$HOME  yassinebha/niak_jupyter_build:0.1 /bin/bash --login -c \
"jupyter notebook --no-browser --port 8888 --ip=*" &&  kde-open 'http://localhost:8888/' \
|| xdg-open 'http://localhost:8888/'|| open 'http://localhost:8888/'
```
*  Head to your browser, a new tab will pop with a jupyter_niak ready to use.
