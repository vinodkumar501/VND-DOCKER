https://github.com/docker-library/official-images
https://docs.docker.com/engine/reference/builder/

FROM
RUN
CMD


FROM
It defines the base image to use to start build process

RUN
It takes commands as argument and runs it to form an image
its used to build an image
executing any commands in linux

CMD
CMD is similar to RUN,
unlike RUN its not executed during "build", but 
when a container is instantiated during image built



FROM ubuntu
RUN apt-get install -y nginx




------------------------------------ 1.Dockerfile ------------------------------------------
FROM ubuntu
MAINTAINER vnd@gmail.com
RUN apt-get update
CMD ["echo", "hello world"]

------------------------------------ ------------------------------------ -----------------

docker build -t vndimg .
docker run <imgid>
hello world


------------------------------------ 2.Dockerfile ------------------------------------------

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

# syntax=docker/dockerfile:1
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py
Each instruction creates one layer:

FROM 
creates a layer from the ubuntu:18.04 Docker image.
Dockerfile reference for the FROM instruction
Whenever possible, use current official images as the basis for your images. We recommend the Alpine image as it is tightly controlled and small in size 
(currently under 6 MB), while still being a full Linux distribution.
adds files from your Docker client’s current directory.

RUN 
builds your application with make.

CMD 
specifies what command to run within the container.



























