FROM debian:latest
MAINTAINER Willian Paixao <willian@ufpa.br>

LABEL version="1.0.0"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  git \
  ca-certificates \
  lmodern \
# texlive-generic-extra \
# texlive-fonts-extra \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-lang-portuguese \
  texlive-latex-base \
  texlive-latex-recommended \
  texlive-latex-extra && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data
VOLUME ["/data"]

