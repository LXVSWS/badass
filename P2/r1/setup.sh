#!/bin/bash

# Set up and enable the bridge interface (br0)
ip link add br0 type bridge
ip link set dev br0 up

# Set up and enable the VXLAN interface (vxlan10)
ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789
ip addr add 20.1.1.1/24 dev vxlan10
ip link set dev vxlan10 up

# Add interfaces to the bridge (br0)
ip link show eth1 2>/dev/null && brctl addif br0 eth1 || true
brctl addif br0 vxlan10
