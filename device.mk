#
# Copyright (C) 2015 Schischu
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

$(call inherit-product, device/samsung/chagall-klimt-common/device.mk)

# This is a tablet
PRODUCT_CHARACTERISTICS := tablet

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xlarge
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/klimtwifi/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/klimtwifi/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# GPS
PRODUCT_COPY_FILES += \
    device/samsung/klimtwifi/configs/gps/gps.conf:system/etc/gps.conf \
    device/samsung/klimtwifi/configs/gps/gps.xml:system/etc/gps.xml

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/klimtwifi/configs/wifi/wpa_supplicant.conf:system/etc/wpa_supplicant.conf \
    device/samsung/klimtwifi/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wpa_supplicant_overlay.conf \
    device/samsung/klimtwifi/configs/wifi/p2p_supplicant_overlay.conf:system/etc/p2p_supplicant_overlay.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

DEVICE_PACKAGE_OVERLAYS += \
    device/samsung/klimtwifi/overlay

# GPS Shim
PRODUCT_PACKAGES += \
    libdmitry

# Camera Hacks
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only

# Assert for flash script
PRODUCT_PROPERTY_OVERRIDES += \
    ro.assert.device=klimtwifi

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, vendor/samsung/klimtwifi/klimtwifi-vendor.mk)
