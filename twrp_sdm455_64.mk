#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_RELEASE_NAME := sdm455_64

# Inherit from sdm455_64 device
$(call inherit-product, device/qualcomm/sdm455_64/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
BOARD_VENDOR := Qualcomm
PRODUCT_BRAND := Qualcomm
PRODUCT_MODEL := SDM455
PRODUCT_MANUFACTURER := Qualcomm
TARGET_VENDOR := Qualcomm
