#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Crypto
MITHORIUM_INCLUDE_CRYPTO_FBE := true
MITHORIUM_INCLUDE_CRYPTO_FDE := true

# Fstab
MITHORIUM_USES_DEVICE_SPECIFIC_FSTAB := true

# Proprietary
MITHORIUM_USES_DEVICE_SPECIFIC_BLOBS := true

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)

# A/B
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# A/B OTA dexopt package
PRODUCT_PACKAGES += otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.sdm455_64.recovery

PRODUCT_VENDOR_PROPERTIES += ro.hardware.bootctrl=sdm455_64

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0.recovery \
    android.hidl.memory.token@1.0.recovery \
    android.hidl.memory@1.0.recovery

# ION
PRODUCT_PACKAGES += \
    libion.recovery

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vendor blobs
ifneq ($(wildcard vendor/qualcomm/sdm455_64/proprietary),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/qualcomm/sdm455_64/proprietary/system,$(TARGET_COPY_OUT_RECOVERY)/root/system) \
    $(call find-copy-subdir-files,*,vendor/qualcomm/sdm455_64/proprietary/vendor,$(TARGET_COPY_OUT_RECOVERY)/root/system)
endif