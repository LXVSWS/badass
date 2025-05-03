#DEBIAN commands

run: 
	pipx inject gns3-gui gns3-server PyQt5
	@echo "create Docker image"
	docker build -t custom-frr:latest .
	@gns3

docker-status:
	sudo systemctl status docker

setup-docker:
	@sudo apt update
	@sudo apt install docker.io
	@sudo systemctl start docker
	@sudo systemctl enable docker
	@sudo usermod -aG docker $(USER)
	@sudo systemctl restart docker

gns3-setup:
	sudo apt update
	sudo apt install python3 python3-pip pipx python3-pyqt5 python3-pyqt5.qtwebsockets python3-pyqt5.qtsvg qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system virtinst software-properties-common ca-certificates curl gnupg2
	sudo apt install snapd busybox-static
	sudo snap install snapd
	sudo snap install dynamips
	pipx install gns3-server 
	pipx install gns3-gui
	pipx ensurepath
