LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := AmbientSensePrebuilt DevicePolicyPrebuilt Eleven PixelWallpapers2022 SoundAmplifierPrebuilt
LOCAL_OVERRIDES_PACKAGES := Chrome Chrome-Stub Maps YouTube YoutubeMusicPrebuilt PrebuiltGmail Drive Maps
LOCAL_OVERRIDES_PACKAGES := Phonograph yetCalc
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
