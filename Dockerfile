FROM centos:7
MAINTAINER Arsenii Gorkin
RUN yum -y install wget
RUN yum groupinstall -y "Development tools"
RUN yum -y update
RUN yum install -y epel-release pandoc
RUN yum -y install git tar gcc make bzip2 openssl openssl-devel which
RUN yum -y update
RUN yum install -y bzip2-devel ncurses ncurses-devel libffi-devel libffi readline readline-devel
RUN yum -y update
RUN yum install -y patch nano python-pip
RUN yum -y update
RUN yum install -y compat-readline5 libxml2-devel libxslt-devel libyaml-devel lzma lzma-devel
RUN yum -y update
RUN yum install -y sqlite sqlite-devel
RUN yum -y update
RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN exec $SHELL
############ INSTALLING Python 3.8.10! You can chage for any you need #################
RUN pyenv install 3.8.10
RUN pyenv global 3.8.10
RUN pyenv rehash
ENV eval "$(pyenv init -)"
CMD python --version
RUN yum -y install httpd
EXPOSE 80 8080
#
