SMARTOS_BASE_URL = https://us-east.manta.joyent.com/Joyent_Dev/public/SmartOS
SMARTOS_ISO_URL  = $(SMARTOS_BASE_URL)/smartos-latest.iso
SMARTOS_USB_URL  = $(SMARTOS_BASE_URL)/smartos-latest-USB.img.bz2

.PHONY: default
default: all

.PHONY: all
all: smartos-virtualbox.box

.PHONY: clean
clean:
	VBoxManage closemedium disk --delete smartos-latest.vmdk
	rm -rf \
		output-virtualbox-iso \
		packer_cache \
		smartos-latest-USB.img \
		smartos-latest.iso \
		smartos-latest.vmdk \
		smartos-virtualbox.box

smartos-virtualbox.box: smartos-latest.iso smartos-latest.vmdk
	packer build \
		-var "smartos_iso_md5=`md5 -q smartos-latest.iso`" \
		template.json

smartos-latest-USB.img:
	wget -q -nc $(SMARTOS_USB_URL)
	bunzip2 smartos-latest-USB.img.bz2

smartos-latest.iso:
	wget -q -nc $(SMARTOS_ISO_URL)

smartos-latest.vmdk: smartos-latest-USB.img
	VBoxManage convertfromraw \
		smartos-latest-USB.img \
		smartos-latest.vmdk \
		--format VMDK
