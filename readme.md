# The *LSDTopoTools* Alpine distribution

<img src="/images/LSD-logo.png" width="200">

This is a very lightweight docker container that uses the [alpine linux distribution](https://www.alpinelinux.org/). If you download this container from docker hub it is only 88 Mb. The drawback is that it does not have the full functionality of *LSDTopoTools*: routines needing the [Point Cloud Library (PCL)](https://en.wikipedia.org/wiki/Point_Cloud_Library) are not included. The main routine using PCL is the terrace and floodplain extration routine; you will need our `lsdtt_pcl` docker container for that. But most of the basic routines will work with the `lsdtt_alpine` distribution. 

## Instructions

### Installing Docker

These are the bare bones instructions. For a bit more detail and potential bug fixes, scroll down to the section on [Docker notes][Docker notes].

1. Download and install [Docker for Windows](https://www.docker.com/docker-windows) (only works with Windows 10 enterprise), [Docker for Mac](https://www.docker.com/docker-mac), or Docker for [Ubuntu](https://www.docker.com/docker-ubuntu) or [Debian](https://www.docker.com/docker-debian).
  * On MacOS we recommend installing docker using brew: `brew cask install docker`
  * On MacOs and Linux, after you install docker you will need to add permissions: `sudo usermod -a -G docker $USER`
  * On Windows 10 you will need to alter a bunch of settings. See [Docker notes][Docker notes] 
2. We will henceforth assume that you actually have a functioning version of Docker on your host machine. If you want more details about how to use docker, or getting it set up (particularly in Windows, in Linux and MacOS this is more straightforward), see our [Docker notes][Docker notes].

### Running the container

#### Part 1: set up an LSDTopoTools directory on your host machine

1. You will want to be able to see *LSDTopoTools* output on your host operating system, so we will need to create a directory for hosting your *LSDTopoTools* data, code, and scripts. 
2. For the purposes of this tutorial, I will assume you are using windows and that you have made a directory `C:\LSDTopoTools`. 
  * You can put this directory anywhere you want as long as you remember where it is. You don't need to put anything in this directory yet. 
  
#### Part 2: Download and run the container

1. To get the container, go into a terminal (MacOS or Linux) or Powershell window (Windows) that has docker enabled and run:
```console
$ docker pull lsdtopotools/lsdtt_alpine_docker
```
2. Now you need to run the container:
```console
$ docker run -it -v C:\LSDTopoTools:/LSDTopoTools lsdtt_alpine_docker
```
  1. The `-it` means "interactive".
  2. The `-v` stands for "volume" and in practice it links the files in the docker container with files in your host operating system. 
  3. After the `-v` you need to tell docker where the directories are on both the host operating system (in this case `C:\LSDTopoTools`) and the container (in this case `/LSDTopoTools`). These are separated by a colon (`:`).
3. Once you do this you will get a `#` symbol showing that you are inside the container. You can now do *LSDTopoTools* stuff. 


### Docker notes


The direction of travel in portability seems to be away from https://www.vagrantup.com/[Vagrant] and toward https://www.docker.com/[Docker]. We are not quite sure why this is, since the https://docs.docker.com/[docker documentation] is similar to documentation for the https://www.youtube.com/watch?v=rLDgQg6bq7o[turbo encabulator]. There are many people quite willing to mansplain why Docker is better but before you feel the urge to do that, please refrain: we have drank a bit of the kool-aid and have been testing *LSDTopoTools* with docker. 

#### Docker quick reference
***
Here are some shortcuts if you just need a reminder of how docker works. 

List all containers
```console
$ docker ps -a
```

List containsers with size
```console
$ docker ps -as
```

Remove all unused conainers
```console
$ docker system prune
```
***

#### Docker on Linux

After you install docker on Linux, you will need to add users to the docker permissions:

```console
$ sudo usermod -a -G docker $USER
```

Once you have done this you will need to log out and log back in again. 


#### Docker for Windows

I have not made any scientific study of this but most *LSDTopoTools* users are on Windows operating systems. 

Firstly, you need to have *Windows 10 Enterprise*. It will not work otherwise (well, that is [not exactly true](https://stefanscherer.github.io/yes-you-can-docker-on-windows-7/) but getting it to work on Windows 7 is a massive pain). If you don't have Windows 10 Enterprise but are on Windows you probably should use Vagrant; see [our vagrant documentation](https://lsdtopotools.github.io/LSDTT_documentation/LSDTT_installation.html#_installing_lsdtopotools_using_virtualbox_and_vagrant). If you do have Windows 10 enterprise then you can download and install Docker for Windows CE. After you install this you will need to restart your computer not once but twice: once after install and a second time to activate the hyper-V feature, which allows you to have 64 bit guest operating systems.

Second, if you have that and have it installed, you might also need to add yourself to the `docker-users` group. To do that, do this (instructions from here: https://github.com/docker/for-win/issues/868):

1. Logon to Windows as Administrator
2. Go to Windows Administrator Tools
3. Look for Windows Computer Management and click on it.
4. Or you can skip steps 1, right mouse clicking Computer Management, go to more, and select run as administrator and provide Administrator password.
5. Double click docker-users group and add your account as member.
6. Also add your account to Hyper-V Administrator. This was added when you installed docker for Windows.
7. Log off from Windows and log back on.
8. Click on Windows icon on bottom left and start Docker for Windows. This will start docker windows service.
9. Start Windows Powershell and type docker --version. It will show Docker version 17.09.1-ce, build 19e2cf6. This is the latest version.