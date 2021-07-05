#!/bin/bash -e
if [[ "${1}" = "" ]]; then
    echo "You must specify an assembly entry file."
    exit 1
fi

nasm -f elf64 "${1}.asm" -o "${1}.o" -i ./lib/
ld "${1}.o" -o "${1}" -O3
rm "${1}.o"
exit 0