#DEBIAN commands
MAKEFLAGS 		+= 	--no-print-directory

run: clean
	make create-venv
	. gns3-env/bin/activate && pip install gns3-gui gns3-server PyQt5
	@echo "create Docker image"
	cd r1 && docker build -t frr-1:latest .
	cd r2 && docker build -t frr-2:latest .	
	cd r3 && docker build -t frr-3:latest .
	cd r4 && docker build -t frr-4:latest .
	@make images
	. gns3-env/bin/activate && gns3

create-venv:
	@echo "create virtualenv"
	python3 -m venv gns3-env

docker-status:
	sudo systemctl status docker

docker-ps:
	docker ps -a
	docker logs <container_id>

images:
	docker images

clean:
	docker system prune -a --volumes
	rm -rf gns3-env

docker-run-custom:
	@echo "run Docker image"
	docker run -it custom-frr:latest bash

#INSTALLERS
installer:
	sudo apt update
	make setup-docker
	make gns3-setup
	make ubridge-install
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


setup-docker:
	sudo apt update
	sudo apt install docker.io
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo usermod -aG docker $(USER)
	sudo systemctl restart docker

gns3-setup:
	sudo apt update
	sudo apt install -y python3 python3-pip pipx python3-pyqt5 python3-pyqt5.qtwebsockets \
	python3-pyqt5.qtsvg qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system \
	virtinst software-properties-common ca-certificates curl gnupg2 busybox-static xterm
	sudo snap install snapd
	sudo snap install dynamips
	pipx install gns3-server 
	pipx install gns3-gui
	pipx ensurepath

ubridge-install:
	sudo apt install -y git build-essential libpcap-dev
	git clone https://github.com/GNS3/ubridge.git
	cd ubridge
	make -C ubridge
	sudo make -C ubridge install
	cd ..
	sudo setcap cap_net_admin,cap_net_raw=ep /usr/local/bin/ubridge
	rm -rf ubridge

