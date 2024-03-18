#
# Copyright (C) 2017 The Android Open Source Project
# Copyright (C) 2017 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
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

LOCAL_PATH := device/xiaomi/vince

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.android_dt_dir=/non-existent androidboot.boot_devices=soc/7824900.sdhci
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := device/xiaomi/vince/prebuilt/Image.gz-dtb

# Platform
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506

# Assert
TARGET_OTA_ASSERT_DEVICE := vince

# Partitions
BOARD_USES_METADATA_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_BLOCK_DEVICES := cust system
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 872415232
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) )

BOARD_SUPER_PARTITION_GROUPS := vince_dynamic_partition
BOARD_VINCE_DYNAMIC_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_VINCE_DYNAMIC_PARTITION_LIST := system system_ext product vendor odm
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw

# TWRP specific build flags
TW_DEVICE_VERSION := by Shiinaeru
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_NTFS_3G := true
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := hbtp_vm
TW_EXCLUDE_TWRPAPP := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_EDL_MODE := true


# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Disable Mouse Cursor
TW_INPUT_BLACKLIST := "hbtp_vm"