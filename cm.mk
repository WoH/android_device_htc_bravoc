# Call this first so apn list is actually copied
$(call inherit-product, vendor/cm/config/cdma.mk)

$(call inherit-product, device/htc/bravoc/full_bravoc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := cm_bravoc
PRODUCT_BRAND   := us_cellular_wwe
PRODUCT_DEVICE  := bravoc
PRODUCT_MODEL   := HTC Desire CDMA
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys \
    BUILD_VERSION_TAGS=release-keys \
    PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys" \
    PRODUCT_NAME=htc_bravo
