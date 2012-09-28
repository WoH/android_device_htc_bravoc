#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic CDMA bravo,
# not specialized for any geography.
#

# First, the most specific values, i.e. the aspects that are specific to GSM

DEVICE_PACKAGE_OVERLAYS := device/htc/bravoc/overlay

# Propreties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    ro.ril.disable.power.collapse=0 \
    windowsmgr.max_events_per_sec=120 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.telephony.ril.v3=signalstrength,singlepdp \
    ro.vold.umsdirtyratio=20

# Second, the aspects that are specific to CDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=310120 \
    ro.cdma.home.operator.alpha=Sprint \
    gsm.sim.operator.numeric=0 \
    gsm.sim.operator.alpha=0 \
    gsm.sim.operator.iso-country=0

# Set default_france.acdb to audio_ctl driver if the ro.cid is HTC__203
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.prl.recognition=1

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

#
# Packages required for bravoc
#

# Sensors
PRODUCT_PACKAGES += \
    gps.bravoc \
    lights.bravoc \
    sensors.bravoc \
    camera.qsd8k

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/bravoc/init.bravoc.rc:root/init.bravoc.rc \
    device/htc/bravoc/init.bravoc.usb.rc:root/init.bravoc.usb.rc \
    device/htc/bravoc/ueventd.bravoc.rc:root/ueventd.bravoc.rc

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/bravoc/bravoc-keypad.kl:system/usr/keylayout/bravoc-keypad.kl \
    device/htc/bravoc/bravoc-keypad.kcm:system/usr/keychars/bravoc-keypad.kcm \
    device/htc/bravoc/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/bravoc/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravoc/h2w_headset.kcm:system/usr/keychars/h2w_headset.kcm \
    device/htc/bravoc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravoc/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/bravoc/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/bravoc/vold.fstab:system/etc/vold.fstab \
    device/htc/bravoc/sysctl.conf:system/etc/sysctl.conf

# Prebuilt modules
ifeq (,$(BUILD_KERNEL))
PRODUCT_COPY_FILES += \
    device/htc/bravoc/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko
endif

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravoc/media_profiles.xml:system/etc/media_profiles.xml

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravoc/bravoc-vendor.mk)