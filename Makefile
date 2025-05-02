#DEBIAN commands
run-gns3:
	pipx inject gns3-gui gns3-server PyQt5
	gns3server 

gns3-setup:
	sudo apt update
	sudo apt install python3 python3-pip pipx python3-pyqt5 python3-pyqt5.qtwebsockets python3-pyqt5.qtsvg qemu-system-x86 qemu-utils libvirt-clients libvirt-daemon-system virtinst software-properties-common ca-certificates curl gnupg2
	sudo apt install snapd
	sudo snap install snapd
	sudo snap install dynamips
	pipx install gns3-server 
	pipx install gns3-gui
