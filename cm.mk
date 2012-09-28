# Call this first so apn list is actually copied
$(call inherit-product, vendor/cm/config/cdma.mk)

$(call inherit-product, device/htc/bravoc/full_bravoc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := cm_bravoc
PRODUCT_BRAND   := htc_wwe
PRODUCT_DEVICE  := bravoc
PRODUCT_MODEL   := HTC Desire CDMA
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bravoc \
    BUILD_ID=IMM76L
