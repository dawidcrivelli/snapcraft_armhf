# Build Snap packages with Docker

Armhf Snap builder: [![](https://images.microbadger.com/badges/image/dawidcrivelli/snapcraft_armhf.svg)](https://microbadger.com/images/dawidcrivelli/snapcraft_armhf "armhf")

Amd64 Snap builder: [![](https://images.microbadger.com/badges/image/dawidcrivelli/snapcraft_armhf:latest-amd64.svg)](https://microbadger.com/images/dawidcrivelli/snapcraft_armhf:latest-amd64 "amd64")

## Install Docker
Install docker
```
sudo apt install docker.io
docker pull snapcore/snapcraft
sudo usermod -a -G docker $USER
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

## Build with snapcraft


Build the two docker images (or skip this step to get them from dockerhub):

```
docker build -t dawidcrivelli/snacraft_armhf:latest . 
docker build -t dawidcrivelli/snacraft_armhf:latest-amd64 -f Dockerfile.amd64 .
```

Copy the sources (here supposed to be in the `src` folder) to a subdirectory, since Snapcraft clutters the working directory:
```
mkdir -p build/{armhf,amd64}
cp -ru src/ build/armhf
cp -ru src/ build/amd64
```

Build the proper snaps:
```
docker run -d --rm -v $PWD/build/armhf:/build dawidcrivelli/snacraft_armhf:latest sh -c "snapcraft clean && snapcraft"
docker run -d --rm -v $PWD/build/amd64:/build dawidcrivelli/snacraft_armhf:latest-amd64 sh -c "snapcraft clean && snapcraft"
```

## Example

We'll clone a Node.js example published on the Snapcraft.io webpage:

```
git clone git@github.com:didrocks/chuck-norris-webserver.git
```

It's very easy to cross-build it, in interactive mode to see it succeed:
```
docker run -it --rm -v $PWD/chuck-norris-webserver:/build snaparm snapcraft
```

At the end, in the `chuck-norris-webserver` directory you will find the file `chuck-norris-webserver_1.0.0_armhf.snap`, confirming that the cross-compilation succeded.
