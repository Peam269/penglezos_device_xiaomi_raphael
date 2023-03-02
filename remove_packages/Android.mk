LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := arcore AmbientSensePrebuilt AppDirectedSMSService Camera2 CarrierSetup ConnMO ConnMetrics DCMO DevicePolicyPrebuilt DiagnosticsToolPrebuilt DMService GCS GoogleTTS HelpRtcPrebuilt MaestroPrebuilt MyVerizonServices NovaBugreportWrapper OBDM_Permissions OemDmTrigger obdm_stub PixelLiveWallpaperPrebuilt PixelWallpapers2021 PixelWallpapers2022 PrebuiltGmail RecorderPrebuilt SafetyHubPrebuilt ScribePrebuilt Showcase SoundAmplifierPrebuilt SprintDM SprintHM talkback Tycho USCCDM VZWAPNLib VzwOmaTriger
LOCAL_OVERRIDES_PACKAGES := Chrome Chrome-Stub Drive Maps YouTube YoutubeMusicPrebuilt PrebuiltGmail
LOCAL_OVERRIDES_PACKAGES := Phonograph yetCalc
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
