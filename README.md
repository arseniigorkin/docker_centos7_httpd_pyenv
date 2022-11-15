Dockerfile for CentOS 7 with Apache and pyenv

This is a working dockerfile to use CentOS 7 with pyenv and Apache2 installed.
One can use this Docerfile to test some settings and manipulations similar to that cPanel offers.
You are welcome to add MySQL/PostgreSQL or any other DB, RabbiMQ/Kafka, nGinx, etc.

This Dockerfile, by default, exposes ports 80 and 8080. You can call it like this:


`$ docker build -t pyenv_on_co7 .`

Then:
`$ docker run -itd -p 8899:80 --rm --name=pyenv_on_co7 pyenv_on_co7 bash` - if you want access to bash on the docker container.


**A few tips for you.**

- If you need expose ports to the local machine add `-p 8899:80` command into the `run`, where `8899` is a port where you will be able to access to the container from your local machine, and `80` is a port in the container. So, if you opern a browser on your local machine and type `http://localhost:8899/` you will see the output of the server inside the container.
- Use `-v` to add some volumes (read about [volumes in the Docker manpages](https://docs.docker.com/storage/volumes/)) to keep your data persistent even after you stop the container. You can use a few volumes: for system user files, for webserver files, for DB files, for configuration etc.
- you can detach the container, by the `-d` flag, so you will be able to close terminal and the container will be alive anyway. You can then enter it at anytime you want by `$ docker attach pyenv_on_co7`. But note: if you have no service, that remaining alive in the container it will not be alive. Your app must spin as a process to make the container alive. For this purpose I suppose you to have `bash` at the end of your `run` command, as this shell will be always alive.
- Use `--detach-keys="ctrl-d"` (set any combination you want) within `attach` command to specify the hotkey for detaching the container (instead of exiting it). So, the copmlete command will look like: `$ docker attach --detach-keys="ctrl-d" pyenv_on_co7`.
- Add `--rm` to autoremove container on exit to make the name available again.
- Do not forget to set a proper configuration in the /etc/httpd/conf/httpd.conf to make your server working.
- Commands for Starting/restarting/stopping the Apache2 server in the CentOS 7 is `$ apachectl -k start`, `$ apachectl -k stop`, `$ apachectl -k restart`.

Should you have any questions or advices - please, message me. Also, do not hesitate to fork this rep and enchance!

Take care!



