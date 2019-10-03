# Copyright (C) 2020 The LineageOS Project
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

BUILD_FINGERPRINT := samsung/ks01ltexx/ks01lte:5.0.1/LRX22C/I9506XXUDRB1:user/release-keys

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

DEVICE_PATH := device/samsung/ks01ltexx

TARGET_OTA_ASSERT_DEVICE := ks01lte,ks01ltexx,GT-I9506,ks01lteskt,ks01ltektt,ks01ltelgt

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_CPU_VARIANT_RUNTIME := krait

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
BOARD_VENDOR := samsung

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 zcache.enabled=1 zcache.compressor=lz4
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
LZMA_RAMDISK_TARGETS := recovery
TARGET_KERNEL_CONFIG := lineage_ks01lte_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/msm8974

# Use Snapdragon LLVM if available on build server
TARGET_USE_SDCLANG := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Enable SVELTE memory configuration
MALLOC_SVELTE := true

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_ks01ltexx.txt
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_NEED_CAMERA_ZSL := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := //$(DEVICE_PATH):camera_parameters_samsung_msm8974
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
    WITH_DEXPREOPT := true
  endif
endif
WITH_DEXPREOPT_DEBUG_INFO := false

# Display
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_SCREEN_DENSITY := 440

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Legacy BLOB Support
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshim_camera.so \
    /system/vendor/lib/libperipheral_client.so|libshim_binder.so


TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/hw/android.hardware.sensors@1.0-service.samsung8974=22 \
    /system/vendor/bin/mm-qcamera-daemon=22 \
    /system/vendor/bin/hw/rild=27

# NFC
include $(DEVICE_PATH)/nfc/bcm2079x/board.mk

# Offmode Charging
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/samsung/ks01ltexx/charger/images

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520	  #20mb
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800	  #300mb
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520	  #20mb
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2390753280	  #Dont change it
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12528352256 #12528368640 - 16384
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_ROOT_EXTRA_FOLDERS := firmware firmware-modem efs
BOARD_ROOT_EXTRA_SYMLINKS := /data/tombstones:/tombstones

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Includes
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_ks01lte
TARGET_RECOVERY_DEVICE_MODULES := libinit_ks01lte

# Netd
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Power HAL
TARGET_USES_INTERACTION_BOOST := true
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power_ext.c

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/ks01ltexx
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_SKIP_EV_REL_INPUT := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# TWRP Support - Optional
ifeq ($(WITH_TWRP),true)
-include $(DEVICE_PATH)/twrp.mk
endif

# SELinux
include device/qcom/sepolicy-legacy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private 
    
# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/vendor/etc/wifi/bcmdhd_sta.bin nvram_path=/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/vendor/etc/wifi/bcmdhd_apsta.bin nvram_path=/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/etc/wifi/bcmdhd_apsta.bin"

# inherit from the proprietary version
-include vendor/samsung/ks01ltexx/BoardConfigVendor.mk

# inherit from the proprietary version
-include vendor/samsung/msm8974-common/BoardConfigVendor.mk
