# Build Snap packages with Docker

## Install Docker
Install docker
```
sudo apt install docker.io
docker pull snapcore/snapcraft
sudo usermod -a -G docker $USER
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

## Build with snapcraft


Build the two docker images:

```
docker build -t snapx86 --target snapx86 .
docker build -t snaparm --target snaparm .
```

Copy Node.js sources to a subdirectory, since Snapcraft clutters the working directory:
```
mkdir -p build/{armhf,amd64}
cp -ru *.js package*.json snap build/armhf
cp -ru *.js package*.json snap build/amd64
```

Build the proper snaps:
```
docker run -d --rm -v $PWD/build/armhf:/build snaparm sh -c "snapcraft clean && snapcraft"
docker run -d --rm -v $PWD/build/amd64:/build snapx86 sh -c "snapcraft clean && snapcraft"
```
