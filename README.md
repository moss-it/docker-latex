Docker LaTeX
==============

[![Docker Stars](https://img.shields.io/docker/stars/moss/latex.svg?style=flat-square)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/moss/latex.svg?style=flat-square)]()


* [Supported tags and respective `Dockerfile` links](#supported-tags-and-respective-dockerfile-links)
* [Base Docker Image](#base-docker-image)
* [Introduction](#introduction)
* [Quickstart](#quickstart)
* [Makefile Example](#makefile-example)
* [Useful links](#useful-links)

## Supported tags and respective `Dockerfile` links

* `latest` [(Dockerfile)](https://github.com/moss-it/docker-latex/blob/master/Dockerfile)

## Base Docker Image

* [debian:8](https://registry.hub.docker.com/_/debian/)

## Introduction

Docker container used for compile LaTex documents and deploy a generated PDF
file.

You can use to do instantaneous compile for each save with `inotify-tools.

## Quickstart

* Simple make:

```
docker run --rm -v $(shell pwd):/data moss/latex make
```

* Auto compile for each save:

```
docker run --rm -v $(shell pwd):/data moss/latex make view
```

## Makefile Example
```
######################
#      Makefile      #
######################

filename=your_file_without_extension

pdf:
	pdflatex ${filename}
	pdflatex ${filename}

text: html
	html2text -width 100 -style pretty ${filename}/${filename}.html | sed -n '/./,$$p' | head -n-2 >${filename}.txt

html:
	@#latex2html -split +0 -info "" -no_navigation ${filename}
	htlatex ${filename}

view:
	while inotifywait --event modify,move_self,close_write ${filename}.tex; \
		do pdflatex -halt-on-error ${filename} &&  pdflatex -halt-on-error \
		${filename}; done

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,snm,toc,nav}
```

## Useful links

[Github remote](https://github.com/moss-it/docker-latex)

[Docker Hub repo](https://hub.docker.com/r/moss/latex/latex)
