#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
    android.hardware.boot@1.1-impl.recovery \
    bootctrl.sdm455_64.recovery

# Apex libraries
PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libcryptfs_hw_intermediates/libcryptfs_hw.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libcryptfs_hw.so

ifeq ($(wildcard vendor/qcom/opensource/cryptfs_hw/Android.bp),)
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)/cryptfs_hw
else
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor/cryptfshw,$(TARGET_COPY_OUT_RECOVERY)/root) \
    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/vendor.qti.hardware.cryptfshw@1.0_intermediates/vendor.qti.hardware.cryptfshw@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/vendor.qti.hardware.cryptfshw@1.0.so
endif

# Fastboot
PRODUCT_PACKAGES += \
    fastboot

# Init scripts
ifneq ($(wildcard vendor/pb),)
PRODUCT_COPY_FILES += \
    bootable/recovery/etc/init/hwservicemanager.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/hwservicemanager.rc \
    bootable/recovery/etc/init/vndservicemanager.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/vndservicemanager.rc
endif

# Keymaster
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm8937

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
