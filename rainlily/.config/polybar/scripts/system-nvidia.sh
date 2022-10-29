#!/bin/sh

mode=$(nvidia-smi)

if [ "$mode" = "NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running." ]; then
	echo " OFF"
else
	echo " $(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)% $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)°C" || echo ""
fi