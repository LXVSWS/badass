# Official FRRouting image as the base image
FROM frrouting/frr:latest

# Remove individual daemon config files
RUN rm -f /etc/frr/bgpd.conf \
          /etc/frr/isisd.conf \
          /etc/frr/staticd.conf \
          /etc/frr/ospfd.conf \
          /etc/frr/zebra.conf

# Replace the default daemons config file
COPY daemons /etc/frr/daemons

# Copy the main frr config file
COPY frr.conf /etc/frr/frr.conf
