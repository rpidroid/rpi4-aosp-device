#
# Copyright 2020 Nimx rpiroid Project
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


PRODUCT_NAME := rpi4

# Art only
PRODUCT_RUNTIMES := runtime_libart_default

# api version
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# vndk
PRODUCT_PACKAGES := vndk-sp

# inherit makefile
# include build/make/target/product/iorap_large_memory_config.mk
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

# Android Framework Overlays
DEVICE_PACKAGE_OVERLAYS += device/rpiroid/rpi4/overlay

# Audio
PRODUCT_PACKAGES += \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	android.hardware.audio@2.0-service \
	audio.primary.pi4 \
    	audio.usb.default \
    	audio.a2dp.default \
    	audio.r_submix.default \
	tinyplay \
	tinycap \
	tinymix \
	tinypcminfo \

# android.hardware.bluetooth.audio@2.0-impl
# frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml


PRODUCT_COPY_FILES := \
	frameworks/av/media/libeffects/data/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	$(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	frameworks/base/data/sounds/effects/ogg/Effect_Tick_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/Effect_Tick.ogg \
	frameworks/base/data/sounds/effects/ogg/camera_click_48k.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/camera_click.ogg \

# Codecs
PRODUCT_COPY_FILES += \
	device/generic/goldfish/camera/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
        device/generic/goldfish/camera/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
  	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \

# Camera
PRODUCT_PACKAGES += \
	android.hardware.camera.provider@2.5-external-service \

PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
	$(LOCAL_PATH)/camera/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml \

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth@1.0-service \
     	android.hardware.bluetooth@1.0-impl \

PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \

# Wifi
PRODUCT_PACKAGES += \
	android.hardware.wifi@1.0-service \
	hostapd \
	libwpa_client \
	wificond \
   	wifilogd \
    	wpa_supplicant \
    	wpa_supplicant.conf \

PRODUCT_COPY_FILES := \
	hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
	frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Display
PRODUCT_PACKAGES += \
    	android.hardware.drm@1.0-impl \
    	android.hardware.drm@1.0-service \
    	android.hardware.graphics.allocator@2.0-impl \
    	android.hardware.graphics.allocator@2.0-service \
    	android.hardware.graphics.composer@2.2-impl \
    	android.hardware.graphics.composer@2.2-service \
    	android.hardware.graphics.mapper@2.0-impl-2.1 \
    	gralloc.pi4 \
    	libGLES_mesa

PRODUCT_PROPERTY_OVERRIDES += \
	debug.drm.mode.force=800x480 \
    	gralloc.drm.kms=/dev/dri/card0 \
    	gralloc.drm.device=/dev/dri/card1 \
    	ro.opengles.version=196609 \
    	ro.rfkilldisabled=1

# memtrack
PRODUCT_PACKAGES += \
	memtrack.pi4 \
	android.hardware.memtrack@1.0-impl \
    	android.hardware.memtrack@1.0-service \

# health
PRODUCT_PACKAGES += \
	android.hardware.health@2.1-service \
    	android.hardware.health@2.1-impl \
    	android.hardware.health.storage@1.0-service \

# gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service.software

# keymaster
PRODUCT_PACKAGES += \
	android.hardware.keymaster@3.0-impl \
    	android.hardware.keymaster@3.0-service \

# usb
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \

PRODUCT_PRODUCT_PROPERTIES := \
	persist.adb.nonblocking_ffs=0 \
    	ro.adb.nonblocking_ffs=0

# ethernet
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml

# Generic Android
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ueventd.common.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
       	frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    	frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
    	frameworks/native/data/etc/android.software.voice_recognizers.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.voice_recognizers.xml \
    	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    	frameworks/native/data/etc/android.software.device_admin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_admin.xml \

PRODUCT_PACKAGES += \
	android.hardware.configstore@1.1-service \
    	vndservicemanager \

# etc stuff
PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/etc/init.usb.rc:root/init.usb.rc \
    	$(LOCAL_PATH)/etc/init.rpi4.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi4.rc \
    	$(LOCAL_PATH)/etc/init.rpi4.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rpi4.usb.rc \
    	$(LOCAL_PATH)/etc/ueventd.rpi4.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
   	$(LOCAL_PATH)/etc/fstab.rpi4:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.rpi4 \
    	$(LOCAL_PATH)/etc/fstab.rpi4:$(TARGET_COPY_OUT_RAMDISK)/fstab.rpi4 \

# Board Firmware
PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/firmware/brcmfmac43455-sdio.bin:root/lib/firmware/brcm/brcmfmac43455-sdio.bin \
    	$(LOCAL_PATH)/firmware/brcmfmac43455-sdio.bin:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/brcm/brcmfmac43455-sdio.bin \
    	$(LOCAL_PATH)/firmware/brcmfmac43455-sdio.clm_blob:root/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob \
    	$(LOCAL_PATH)/firmware/brcmfmac43455-sdio.clm_blob:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob \
    	$(LOCAL_PATH)/firmware/brcmfmac43455-sdio.txt:root/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt \
    	$(LOCAL_PATH)/firmware/brcmfmac43455-sdio.txt:$(TARGET_COPY_OUT_RAMDISK)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt \
    	$(LOCAL_PATH)/firmware/BCM4345C0.hcd:root/lib/firmware/brcm/BCM4345C0.hcd \

