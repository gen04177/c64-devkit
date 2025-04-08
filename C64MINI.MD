# C64 Mini Tutorial

## How to Create a D64 Disk and Add a PRG File

### Requirements:
- VICE emulator installed (includes c1541 tool)
- .prg file

1. Open a terminal and go to your build folder:
`cd /opt/c64-devkit/build`

2. Create a blank D64 disk image and insert your PRG file into the disk image:
`c1541 -format "demo,01" d64 demo.d64 -write c64-asm.prg "demo.prg"`


## How to Load a .d64 Disk on C64 Mini

### Requirements:
- A USB stick formatted as FAT32 (max. 32GB and max. 256 items (files and/or folders) )
- Your demo.d64 disk image

1. Copy the Disk Image to USB:

Copy demo.d64 to the root of your USB stick

2. Press MENU, go to MEDIA ACCESS, and manually mount demo.d64

3. Load Your Program: 

In BASIC, type:

`LOAD"*",8,1`

`RUN`


