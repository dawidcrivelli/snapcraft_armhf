FROM multiarch/ubuntu-core:armhf-xenial as snaparm
RUN apt-get update && apt-get -y install snapcraft bluez libbluetooth-dev build-essential git libudev-dev
COPY npmrc /root/.npmrc
WORKDIR /build


FROM snapcore/snapcraft as snapx86
RUN apt-get update && apt-get -y install snapcraft bluez libbluetooth-dev build-essential git libudev-dev
WORKDIR /build
