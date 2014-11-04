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
