#!/bin/bash

# init; also creates a two-line feed
echo -e "\x1b\x40" > /dev/usb/lp0

# use font A
echo -e "\x1b\x4d\x00" > /dev/usb/lp0

echo -e "Hello!" > /dev/usb/lp0

# QR code printing does not work :-(
# m = \x0 # size => auto
# n = M # EC level => medium
# k = 1 # component type 1
# dL = 9 # 9 bytes of data
# dH = 0 # high byte of 9 is 0
# data => 'hello'
# echo -e "\x1b\x5a\x01H\x01\x09\x00hellllllo" > /dev/usb/lp0

# 7654 3210  0x
# ---- ----  --
# 1011 1000  B8 # BIIG

# ok
# TODO pipe payload through `fold -sw 32` to wrap at spaces
# before reaching beyond 32 characters
# echo -e "This is regular text\n" > /dev/usb/lp0

# ok
# echo -e "\x1b\x21\x10This is printed double height\x1b\x21\x00" > /dev/usb/lp0

# ok
# echo -e "\x1b\x21\x20This is printed double width\x1b\x21\x00" > /dev/usb/lp0

# ok
# echo -e "\x1b\x21\x80This is underlined printed\x1b\x21\x00" > /dev/usb/lp0

# nope
# echo -e "\x1b\x21\x08This is bold printed\x1b\x21\x00" > /dev/usb/lp0

# nope
# echo -e "\x1b\x45\x01This is bold printed\x1b\x45\x00" > /dev/usb/lp0

# nope
# echo -e "\x1b\x02\x01This is underlined 1pt printed\x1b\x02\x00" > /dev/usb/lp0
# echo -e "\x1b\x02\x02This is underlined 2pt printed\x1b\x02\x00" > /dev/usb/lp0

# ok
# echo -e "\x1b\x4d\x00Chosen font is A" > /dev/usb/lp0

# ok
# echo -e "\x1b\x4d\x01Chosen font is B" > /dev/usb/lp0

# nope
# echo -e "\x1b\x56\x0190°\x1b\x56\x00" > /dev/usb/lp0

# ok
# echo -e "\x1d\x42\x01inverse\x1d\x42\x00" > /dev/usb/lp0

# ok
# echo -e "\x1b\x61\x01This is the centered end." > /dev/usb/lp0

echo -e "The end." > /dev/usb/lp0

# two line feeds
echo -e "\x1b\x64\x02" > /dev/usb/lp0
