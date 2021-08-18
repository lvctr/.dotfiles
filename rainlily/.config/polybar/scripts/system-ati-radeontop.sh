#!/bin/sh

echo " $(radeontop -l 1 -d - | grep -o -e "gpu[^.]*" | sed "s/gpu //")%" || echo ""