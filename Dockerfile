# armhf related docker files!
FROM multiarch/ubuntu-core:armhf-xenial as snaparm

# Prepare the cross build binaries
COPY resin-xbuild cross-build-start cross-build-end qemu-arm-static /usr/bin/
# NPM settings for permissions under snap and cross-compilation
COPY npmrc /root/.npmrc
WORKDIR /build

# Install snapcraft and compilers
RUN [ "cross-build-start" ]
RUN apt-get update && apt-get -y install snapcraft bluez libbluetooth-dev build-essential git libudev-dev
RUN [ "cross-build-end" ]
