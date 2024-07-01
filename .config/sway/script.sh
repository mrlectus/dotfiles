#!/usr/bin/bash
if grep -q open /proc/acpi/button/lid/LID/state; then
    swaymsg output <Unknown 0x20EC 0x00000000> enable
else
    swaymsg output <Unknown 0x20EC 0x00000000> disable

fi
