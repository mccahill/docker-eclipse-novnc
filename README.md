docker-ubuntu-lxde-novnc
=========================


Build yourself
```
sudo docker build -t docker-ubuntu-lxde-novnc .
```

Run
```
sudo docker run -i -t -p 6080:6080 docker-ubuntu-lxde-novnc
```

Browse http://127.0.0.1:6080/vnc.html

Securing
--------
To enable encrypted connections, you need to create a noVNC self.pem
certificate file, and the private key should ideally be signed by a known
certificate authority. Note that you will run into trouble if you include the
entire CA signing chain - self.pem should only have the private key and
the CA signed cert, because it looks like the cert is passed on the command line to websocify,
and you can exceed the command line max length or something. This is a problem for Firefox
which wants to see the entire signing chain for certs issued by Commodo.


Xvfb vs XDummy/Xorg
-------------------
There are two approaches that can be taken to set up a virtual framebuffer for the VNC
server. The Dockerfile.xvfb build will create a container that uses the ancient and venerable
Xvfb approach, while the Dockerfile.xorg creates a container the sets up an Xdummy framebuffer
in Xorg. For the Xorg approach, we also need to set up the xorg.conf config file so you might 
want take a look at the settings there.

The reason for considering the Xorg approach over Xvfb is Xorg+Xdummy support the randr 
dynamcic screen resizing functions so there are fewer warnings thrown by apps like firefox,
and someday we might get clever about resizing on the fly, or take advantage of GLX extnesions.
See https://www.xpra.org/trac/wiki/Xdummy for details.


Extending
---------

To add scripts to run at startup, add them to this folder, with a ```.sh``` extension:

```
/etc/startup.aux/
```

To add supervisord configs, add them to this folder:
```
/etc/supervisor/conf.d/
```
