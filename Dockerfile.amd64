# Cache the installation of compilers under amd64 docker
FROM snapcore/snapcraft as snapx86
RUN apt-get update && apt-get -y install snapcraft bluez libbluetooth-dev build-essential git libudev-dev zlib1g-dev
WORKDIR /build

