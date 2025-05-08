#DEBIAN commands

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

setup-docker:
	@sudo apt update
	@sudo apt install docker.io
	@sudo systemctl start docker
	@sudo systemctl enable docker
	@sudo usermod -aG docker $(USER)
	@sudo systemctl restart docker

gns3-setup:
	sudo apt update
	sudo apt install -y python3 python3-pip pipx python3-pyqt5 python3-pyqt5.qtwebsockets \
	python3-pyqt5.qtsvg qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system \
	virtinst software-properties-common ca-certificates curl gnupg2 busybox-static
	sudo snap install snapd
	sudo snap install dynamips
	pipx install gns3-server 
	pipx install gns3-gui
	pipx ensurepath

ubridge-install:
	sudo apt update
	sudo apt install -y git build-essential libpcap-dev
	git clone https://github.com/GNS3/ubridge.git
	cd ubridge
	make all
	sudo make install
	which ubridge
	cd ..
	sudo setcap cap_net_admin,cap_net_raw=ep /usr/local/bin/ubridge
	sudo usermod -aG docker $USER
	rm -rf ubridge


	




