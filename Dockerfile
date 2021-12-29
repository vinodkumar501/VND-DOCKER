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


https://docs.sevenbridges.com/docs/upload-your-docker-image-with-a-dockerfile

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
creates a new layer on top of prev layer 

CMD 
specifies what command to run within the container.
specifies a default command to run container at execution time.

ENV
set env variables, these can be referenced in dockerfile itself and are visible to the container at runtime.

ENTRYPOINT
Whne you finish to build a docker image , entrypoint will be the first command to run inside a container.
argument set the the default appn that is used everytime the container is created using the image

it executes when you build the docker image 

it overrides whatever the CMD command does

ADD
command gets 2 arguments src and dest
it basically copies the files from src on thehost into containers own filesystem at teh destination


ADD /srcdire /destdire

ENV
used to set the env var . these var consists of key and value pair which can be accessed within the container by scripts and appn

WORKDIR
used to set where the command defined with CMD to be executed.

WORKDIR /pathdir





------------------------------------------------------------------------------------------------

FROM ubuntu
MAINTAINER vnd
RUN apt-get update && apt-get install -y nginx
ADD index.html /usr/share/nginx/html/index.html
ENTRYPOINT ["/usr/sbin/nginx","-g", "daemon off;"]                   # deamon off --> appn will run on foreground
EXPOSE 80                                                            # deamon on --> appn will run on background


CMD
If you specify an additional argument after docker run <image>, the command specified as the argument will override any command set 
within the CMD instruction in the Dockerfile.


ADD
The ADD instruction is used to copy files, directories or remote file URLs from their original location <source> and to the container at the specified path <destination>

You can specify multiple <source> items. If those are files or folders, they must be located within the context of the build. The context of a build can either be on your local file system (the directory where you execute the command to build the image based 
on the Dockerfile) or it can be a URL (location of a Git repository, for example).


COPY
There are two major differences between ADD and COPY:

ADD can also take a URL as <source>.
If the <source> parameter of the ADD instruction is an archive in a recognized compression format, it will be unpacked. However, the COPY instruction will only copy the archive file, without unpacking it.
The COPY instruction is used to copy files or directories to the container at the specified path. COPY has the following format:

Text

COPY <source>...<destination>






















