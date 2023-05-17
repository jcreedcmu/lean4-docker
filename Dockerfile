FROM buildpack-deps:mantic

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
RUN apt-get install -y emacs git
RUN mkdir /vendor
RUN cd /vendor && git clone https://github.com/dwrensha/math-puzzles-in-lean4.git
RUN cd /vendor/math-puzzles-in-lean4 && lake exe cache get && lake build
RUN cd /vendor && git clone https://github.com/leanprover/lean4-mode
COPY ./emacs-support root/emacs-support
RUN emacs --script /root/emacs-support/install-emacs-packages.el
COPY ./emacs.d /root/.emacs.d/
COPY ./scripts /root/scripts
