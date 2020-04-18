# Buildroot for TCNopen
[Buildroot](https://buildroot.org) based embedded [Linux](https://www.kernel.org) OS for TCNopen.
There are configurations for the Raspberry Pi 4 / 64 enabled.

## How-to
 1. [Download](https://buildroot.org/download.html) or [clone](https://github.com/buildroot/buildroot) [Buildroot](https://buildroot.org) 
    Buildroot >= buildroot-20200219 is required
 2. Download Buildroot-External for TCNopen to br_tcnopen
 3. Navigate into Buildroot's root directory and define br_tcnopen as an [external](https://buildroot.org/downloads/manual/manual.html#outside-br-custom):
```
buildroot$ make BR2_EXTERNAL=/PATH/TO/trdp_test/buildroot-external/ trdp_conftest_rpi4_defconfig
```
To build out of tree, add `O=/PATH/TO/BUILD/DIR` and continue in this directory  
 4. Now you will find the pre-selected `TRDP Test` package under `External options  --->` in `make menuconfig`
```
 5. Run `make`, wait, and find the image in `image/sdcard.img`
 6. Write the image to an sd card, e.g. (with `sdX` = your sd card's device name):
 ```
 buildroot$ sudo dd bs=4M if=output/images/sdcard.img of=/dev/sdX conv=fsync status=progress
 ```
 7. Boot your device. TRDP Conftest has to be started manually 
buildroot$ main_test
 8. Ethernet is configured to use DHCP. Login with user `root` and password `root`

