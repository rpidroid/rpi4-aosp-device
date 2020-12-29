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

# enable apex update
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# include vendor image components
$(call inherit-product, device/rpidroid/rpi4/device.mk)

# product information
PRODUCT_MANUFACTURER := Raspberry PI4
PRODUCT_BRAND := Android
PRODUCT_NAME := aosp_rpi4
PRODUCT_DEVICE := rpi4
PRODUCT_MODEL := AOSP on rpi4
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_SOONG_NAMESPACES += external/mesa3d

# inherit base required android components
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
