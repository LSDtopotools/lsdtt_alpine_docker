# The *LSDTopoTools* Alpine distribution


![LSDTT logo](/images/LSD-logo.png)
image::[width=200]

This is a very lightweight docker container that uses the [alpine linux distribution](https://www.alpinelinux.org/). If you download this container from docker hub it is only 88 Mb. The drawback is that it does not have the full functionality of *LSDTopoTools*: routines needing the [Point Cloud Library (PCL)](https://en.wikipedia.org/wiki/Point_Cloud_Library) are not included. The main routine using PCL is the terrace and floodplain extration routine. 

## Instructions

### Installing Docker

These are the bare bnes instructions. For a bit more detail and potential bug fixes, scroll down to the section on <<Docker notes>>.

1. Download and install [Docker for Windows](https://www.docker.com/docker-windows) (only works with Windows 10 enterprise), [Docker for Mac](https://www.docker.com/docker-mac), or Docker for [Ubuntu](https://www.docker.com/docker-ubuntu) or [Debian](https://www.docker.com/docker-debian).

2.. On Mac we recommend installing docker using brew: `brew cask install docker`

3. We will henceforth assume that you actually have a functioning version of Docker on your host machine. If you want more details about how to use docker, or getting it set up (particularly in Windows, in Linux and MacOS this is more straightforward), see our appendix on Docker.

### More stuff here

4. To get the container, go into a terminal (MacOS or Linux) or Powershell window (Windows) that has docker enable and run:
```console
$ docker pull lsdtopotools/lsdtt_alpine
```

### Docker notes


The direction of travel in portability seems to be away from https://www.vagrantup.com/[Vagrant] and toward https://www.docker.com/[Docker]. We are not quite sure why this is, since the https://docs.docker.com/[docker documentation] is similar to documentation for the https://www.youtube.com/watch?v=rLDgQg6bq7o[turbo encabulator]. There are many people quite willing to mansplain why Docker is better but before you feel the urge to do that, please refrain: we have drank a bit of the kool-aid and have been testing *LSDTopoTools* with docker. 

.Docker quick reference
**************************************
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

**************************************

#### Docker on Linux

After you install docker on Linux, you will need to add users to the docker permissions:

```console
$ sudo usermod -a -G docker $USER
```

Once you have done this you will need to log out and log back in again. 


#### Docker for Windows

I have not made any scientific study of this but most *LSDTopoTools* users are on Windows operating systems. 

Firstly, you need to have *Windows 10 Enterprise*. It will not work otherwise. If you don't have Windows 10 Enterprise but are on Windows you probably should use the Vagrant instructions. If you do have Windows 10 enterprise then you can download and install Docker for Windows CE. After you install this you will need to restart your computer not once but twice: once after intall and a second time to activate the hyper-V feature, which allows you to have 64 bit guest operating systems.

Second, if you have that and have it installed, you also need to add yourself to the `docker-users` group. To do that, do this (instructions from here: https://github.com/docker/for-win/issues/868):

1. Logon to Windows as Administrator
2. Go to Windows Administrator Tools
3. Look for Windows Computer Management and click on it.
4. Or you can skip steps 1, right mouse clicking Computer Management, go to more, and select run as administrator and provide Administrator password.
5. Double click docker-users group and add your account as member.
6. Also add your account to Hyper-V Administrator. This was added when you installed docker for Windows.
7. Log off from Windows and log back on.
8. Click on Windows icon on bottom left and start Docker for Windows. This will start docker windows service.
9. Start Windows Powershell and type docker --version. It will show Docker version 17.09.1-ce, build 19e2cf6. This is the latest version.