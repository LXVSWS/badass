#DEBIAN commands
MAKEFLAGS 		+= 	--no-print-directory

run: clean
	pipx inject gns3-gui gns3-server PyQt5
	@echo "create Docker image"
	docker build -t custom-frr:latest .
	@make images
	@gns3

docker-status:
	sudo systemctl status docker

images:
	docker images

clean:
	docker system prune -a --volumes

docker-run-custom:
	@echo "run Docker image"
	docker run -it custom-frr:latest bash

#INSTALLERS
installer:
	sudo apt update
	make setup-docker
	make gns3-setup
	make ubridge-install
	make dynamips-installq
	sudo modprobe vxlan
	sudo modprobe bridge
	sudo modprobe veth
	sudo modprobe ip_tables
	sudo modprobe ip6_tables
	sudo modprobe ipt_MASQUERADE
	sudo modprobe ip6t_REJECT
	sudo modprobe ipt_REJECT    
	sudo modprobe ip6t_LOG   
	sudo modprobe ipt_LOG    
	sudo modprobe ip6t_rt     
	export PATH=$PATH:/sbin:/usr/sbin  

setup-docker:
	sudo apt update
	sudo apt install docker.io
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo usermod -aG docker $(USER)
	groups
	sudo systemctl restart docker

gns3-setup:
	sudo apt update
	sudo apt install -y python3 python3-pip pipx python3-pyqt5 python3-pyqt5.qtwebsockets \
	python3-pyqt5.qtsvg qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system \
	virtinst software-properties-common ca-certificates curl gnupg2 busybox-static xterm vpcs libelf-dev
	sudo usermod -aG wireshark $(USER)
	groups
	sudo dpkg-reconfigure wireshark-common
	pipx install gns3-server 
	pipx install gns3-gui
	pipx upgrade gns3-gui
	pipx ensurepath

dynamips-install:
	sudo apt update
	sudo apt install -y git libelf-dev
	sudo apt install cmake
	git clone https://github.com/GNS3/dynamips.git
	cd dynamips
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
	cd ../..	
	rm -rf dynamips	

ubridge-install:
	sudo apt install -y git build-essential libpcap-dev
	git clone https://github.com/GNS3/ubridge.git
	cd ubridge
	make -C ubridge
	sudo make -C ubridge install
	cd ..
	sudo setcap cap_net_admin,cap_net_raw=ep /usr/local/bin/ubridge
	sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/dumpcap
	sudo setcap cap_net_raw,cap_net_admin+eip /bin/dumpcap
	rm -rf ubridge
