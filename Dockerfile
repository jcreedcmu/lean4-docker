FROM buildpack-deps:plucky

ENV ELAN_HOME=/usr/local/elan \
    PATH=/usr/local/elan/bin:$PATH \
    LEAN_VERSION=leanprover/lean4:nightly

RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y --no-modify-path --default-toolchain $LEAN_VERSION; \
    chmod -R a+w $ELAN_HOME; \
    elan --version; \
    lean --version; \
    leanc --version; \
    lake --version;
RUN apt-get update
RUN apt-get install -y emacs git silversearcher-ag gpg sudo
RUN apt update
RUN mkdir /vendor
RUN chown -R ubuntu /vendor
RUN chown -R ubuntu:ubuntu $ELAN_HOME

USER ubuntu

RUN cd /vendor && git clone https://github.com/leanprover/lean4-mode
RUN cd /vendor && git clone https://github.com/jcreedcmu/dot-emacs.git
COPY ./emacs-support /home/ubuntu/emacs-support
RUN emacs --script /home/ubuntu/emacs-support/install-emacs-packages.el
COPY ./scripts /home/ubuntu/scripts
RUN /home/ubuntu/scripts/connect-dotemacs.sh

USER root

RUN chown -R ubuntu /home/ubuntu
