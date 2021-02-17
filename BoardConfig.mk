# Copyright (C) 2020 The LineageOS Project
# Copyright (C) 2020 The PixelExperience Project
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

# Inherit from motorola msm8953-common
-include device/motorola/msm8953-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/ali

# Assertions
TARGET_OTA_ASSERT_DEVICE := ali

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_CONFIG := ali_defconfig

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/adspd.xml

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# NFC
BOARD_NFC_CHIPSET := pn54x

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/device.prop

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3271557120
BOARD_VENDORIMAGE_PARTITION_SIZE := 671088640
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 26317376

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# inherit from the proprietary version
-include vendor/motorola/ali/BoardConfigVendor.mk
