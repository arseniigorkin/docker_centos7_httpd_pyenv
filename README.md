Dockerfile for CentOS 7 with Apache and pyenv

This is a working dockerfile to use CentOS 7 with pyenv and Apache2 installed.
This exposes ports 80 and 8080. You can call it like this:


`$ docker build -t pyenv_on_co7 .`

Then:
`$ docker run -itd -p 8899:80 --rm --name=pyenv_on_co7 pyenv_on_co7 bash` - if you want access to bash on the docker container.


**A few tips for you.**

- If you need expose ports to the local machine use next `run` command: `$ docker run -p 8899:80 -itd --rm --name=pyenv_on_co7 pyenv_on_co7 bash`, where `8899` is a port where you will be able to access to the container from your local machine, and `80` is a port in the container. So, if you opern a browser on your local machine and type `http://localhost:8899/` you will see the output of the server inside the container.
- Use `-v` to add some volumes (read about [volumes in the Docker manpages](https://docs.docker.com/storage/volumes/)) to keep your data persistent even after you stop the container. You can use a few volumes: for system user files, for webserver files, for DB files, for configuration etc.
- you can detach the container, by the `-d` flag, so you will be able to close terminal and the container will be alive anyway. You can then enter it at anytime you want by `$ docker attach pyenv_on_co7`. But note: if you have no service, that remaining alive in the container it will not be alive. Your app must spin as a process to make the container alive. For this purpose I suppose you to have `bash` at the end of your `run` command, as this shell will be always alive.
- Add `--rm` to autoremove container on exit to make the name available again.

Should you have any questions or advices - please, message me. Also, do not hesitate to fork this rep and enchance!

Take care!



