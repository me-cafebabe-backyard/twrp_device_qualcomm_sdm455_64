#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/qualcomm/sdm455_64

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
  boot \
  system \
  vendor \
  vbmeta

# Bootloader
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 loop.max_part=7 swiotlb=1
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware androidboot.selinux=permissive # from mithorium-common
BOARD_KERNEL_CMDLINE += veritykeyid=id:
TARGET_PREBUILT_KERNEL := device/qualcomm/kernel-sdm455_64/Image.gz-dtb

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE)

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# TWRP
TW_INCLUDE_REPACKTOOLS := true
