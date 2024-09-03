# Raspberry pi Printserver with HP Laser 100 series support (Under development)
This builds an image for a printserver. Upon this image is isntalled:
* cups
* cockpit
* avahi

## Building the image By yourself

### Prerequisites

* Git
* Packer
* Packer ARM Builder Plugin

### Dependencies
Before we start building, you need to install the required dependencies on your host machine(Ubuntu 18.04/20.04 LTS). Just follow the steps given below to set up the build environment:

Install the required binaries on the host machine.

    sudo apt update
    sudo apt install git wget zip unzip build-essential kpartx qemu binfmt-support qemu-user-static e2fsprogs dosfstools


Download the Packer from the official website and configure it on your host machine 
Alternatively, you can install Packer using apt packer managers. Follow the instructions from official Hashicorp documentation - https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/docker-get-started.


Also a usefull quick-start guide is https://linuxhit.com/build-a-raspberry-pi-image-packer-packer-builder-arm/


### Building ARM image

For building the ARM image, the Packer uses the provisioners to mount the image on your local file system and to make changes in the base ARM image.

Clone the codebase from the GitHub repository and follow the instructions for building ARM images using Packer. Go to the `raspberry-pi-os-image-builder` directory and execute the Packer build command.

    # Clone GitHub repository
    git clone https://github.com/pc-magas/printserver_packer_rpi.git
    cd printserver_packer_rpi
    sudo packer build packer-raspberry-pi-os-lite.json

Verify the file location and size once Packer build is completed. Archive the output image file to reduce the size on disk.

    # Check file location and size
    ls -la output-arm-image/image# Check file size
    du -hs output-arm-image/image

    # Create zip archive
    zip -r rpi-arm-image.zip output-arm-image/image

Use the Raspberry Pi Imager or any other tool to create a bootable SD card.
