#!/bin/bash

# /etc/libvirt/hooks/qemu

HCPUS=0-2,8-10
MCPUS=3-7,11-15

UNDOFILE=/var/run/libvirt/qemu/vfio-isolate-undo.bin

disable_isolation () {
	export MAKEOPTS='-j16'
	export MAKEFLAGS='-j16'

	vfio-isolate \
		restore $UNDOFILE

	taskset -pc 0-15 2  # kthreadd reset
}

enable_isolation () {
	export MAKEOPTS='-j3'
	export MAKEFLAGS='-j3'

	vfio-isolate \
		-u $UNDOFILE \
		drop-caches \
		cpuset-modify --cpus C$HCPUS /system.slice \
		cpuset-modify --cpus C$HCPUS /user.slice \
		compact-memory \
		irq-affinity mask C$MCPUS

	taskset -pc $HCPUS 2  # kthreadd only on host cores
}

test_func () {
	export MAKEOPTS='-j7'
	export MAKEFLAGS='-j7'
}

case "$2" in
"prepare")
	enable_isolation
	;;
"started")
	test_func
	;;
"release")
	disable_isolation
	;;
esac