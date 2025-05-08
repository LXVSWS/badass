#!/bin/bash

# Set up and enable the bridge interface (br0)
ip link add br0 type bridge
ip link set dev br0 up

# Set up and enable the VXLAN interface (vxlan10)
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up

# Add interfaces to the bridge (br0)
brctl addif br0 vxlan10
brctl addif br0 eth1
