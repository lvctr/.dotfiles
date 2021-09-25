#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

MULLVAD_STATUS=$(mullvad status)

if echo $MULLVAD_STATUS | grep -q 'Connected'; then
  echo -e " mullvad"
 elif echo $MULLVAD_STATUS | grep -q 'Connecting'; then
   echo -e " connecting..."
 else
  echo -e " -"
fi
