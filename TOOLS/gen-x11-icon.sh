#!/bin/sh

# This script is expected to be called as TOOLS/gen-x11-icon.sh (it will access
# etc/mpv-icon...), and it will write video/out/x11_icon.bin.

conv() {
    echo
    identify -format "icon: %w %h" "$1"
    convert "$1" -depth 8 rgba:-
}

(echo "# File generated by gen-x11-icon.sh" ;
 conv etc/mpv-icon-8bit-16x16.png ;
 conv etc/mpv-icon-8bit-32x32.png ;
 conv etc/mpv-icon-8bit-64x64.png) | gzip -c > video/out/x11_icon.bin
