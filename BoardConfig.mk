#
# Copyright 2020 Nimx rpiroid project
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

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := cortex-a72
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 

TARGET_BOARD_PLATFORM := bcm2711

TARGET_USES_64_BIT_BINDER := true

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

PRODUCT_FULL_TREBLE := true
BOARD_VNDK_VERSION := current

BOARD_FLASH_BLOCK_SIZE := 4096
MALLOC_SVELTE := true

USE_XML_AUDIO_POLICY_CONF := 1

BOARD_USES_DRM_GRALLOC := true
USE_OPENGL_RENDERER := true
BOARD_GPU_DRIVERS := v3d virgl
TARGET_USES_HWC2 := true
TARGET_SCREEN_DENSITY := 213

WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/rpidroid/rpi4/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/rpidroid/rpi4/bluetooth/vnd_rpi4.txt

BOARD_SEPOLICY_DIRS += \
    device/rpidroid/rpi4/sepolicy

DEVICE_MANIFEST_FILE := device/rpidroid/rpi4/manifest.xml
DEVICE_MATRIX_FILE := device/rpidroid/rpi4/compatibility_matrix.xml

ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
  endif
endif
