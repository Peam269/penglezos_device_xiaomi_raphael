KERNEL="https://github.com/onettboots/bool-x_xiaomi_raphael"
VENDOR="https://github.com/penglezos/vendor_xiaomi_raphael"

CLANG="https://gitlab.com/onettboots/boolx-clang -b Clang-16.0_x86"
DEVICESETTINGS="https://github.com/LineageOS/android_packages_resources_devicesettings"
HARDWARE="https://github.com/onettboots/android_hardware_xiaomi"
DISPLAY="https://github.com/xdsolraC/hardware_qcom_display.git"

KPROFILES="https://github.com/onettboots/Boolx_apps_KProfiles"
AUDIOFX="https://github.com/LineageOS/android_packages_apps_AudioFX"
OTOMUSICPLAYER="https://github.com/onettboots/packages_apps_OtoMusicPlayer"
GCAM="https://gitlab.com/VEN0M98/vendor_GcamBSG"



# Check if this is the initial setup or not
FILE=initialsetup > /dev/null 2>&1
if test -f "$FILE"; then :
else
    rm -rf kernel/xiaomi/raphael > /dev/null 2>&1
    rm -rf vendor/xiaomi/raphael > /dev/null 2>&1
    rm -rf prebuilts/clang/host/linux-x86/boolx-clang > /dev/null 2>&1
    rm -rf packages/resources/devicesettings > /dev/null 2>&1
    rm -rf hardware/xiaomi
    rm -rf hardware/qcom-caf/sm8150/display
    rm -rf packages/apps/KProfiles
    rm -rf packages/apps/AudioFX
    rm -rf packages/apps/OtoMusicPlayer
    rm -rf vendor/xiaomi/miuicamera
    echo "Downloading dependencies (initial setup)..."
fi

# Pull changes / download non-existing dependencies

# Raphael-Vendor
if [ -d "vendor/xiaomi/raphael" ]
then
    echo "Pulling changes from GitHub"
    git -C vendor/xiaomi/raphael pull 2>&1 | grep "fatal"
else
    git clone $VENDOR vendor/xiaomi/raphael --depth=1 2>&1 | grep "fatal"
    echo "Vendor downloaded"
fi

# Raphael-Kernel
if [ -d "kernel/xiaomi/raphael" ]
then
    git -C kernel/xiaomi/raphael pull 2>&1 | grep "fatal"
else
    git clone $KERNEL kernel/xiaomi/raphael --depth=1 2>&1 | grep "fatal"
    echo "Kernel downloaded"
fi

# BoolX-Clang
if [ -d "prebuilts/clang/host/linux-x86/boolx-clang" ]
then
    git -C prebuilts/clang/host/linux-x86/boolx-clang pull 2>&1 | grep "fatal"
else
    git clone $CLANG prebuilts/clang/host/linux-x86/boolx-clang --depth=1 2>&1 | grep "fatal"
    echo "BoolX-Clang downloaded"
fi

# Lineage Devicesettings (XiaomiParts)
if [ -d "packages/resources/devicesettings" ]
then
    git -C packages/resources/devicesettings pull 2>&1 | grep "fatal"
else
    git clone $DEVICESETTINGS packages/resources/devicesettings 2>&1 | grep "fatal"
    echo "XiaomiParts downloaded"
fi

# Xiaomi Hardware
if [ -d "hardware/xiaomi" ]
then
    git -C hardware/xiaomi pull 2>&1 | grep "fatal"
else
    git clone $HARDWARE hardware/xiaomi 2>&1 | grep "fatal"
    echo "Xiaomi Hardware downloaded"
fi

# SM8150 Display
if [ -d "hardware/qcom-caf/sm8150/display" ]
then
    git -C hardware/qcom-caf/sm8150/display pull 2>&1 | grep "fatal"
else
    git clone $DISPLAY hardware/qcom-caf/sm8150/display 2>&1 | grep "fatal"
    echo "SM8150 Display downloaded"
fi

# KProfiles
if [ -d "packages/apps/KProfiles" ]
then
    git -C packages/apps/KProfiles pull 2>&1 | grep "fatal"
else
    git clone $KPROFILES packages/apps/KProfiles 2>&1 | grep "fatal"
    echo "KProfiles downloaded"
fi

# Lineage AudioFX (equalizer)
if [ -d "packages/apps/AudioFX" ]
then
    git -C packages/apps/AudioFX pull 2>&1 | grep "fatal"
else
    git clone $AUDIOFX packages/apps/AudioFX 2>&1 | grep "fatal"
    echo "AudioFX downloaded"
fi

# Oto Music Player
if [ -d "packages/apps/OtoMusicPlayer" ]
then
    git -C packages/apps/OtoMusicPlayer pull 2>&1 | grep "fatal"
else
    git clone $OTOMUSICPLAYER packages/apps/OtoMusicPlayer 2>&1 | grep "fatal"
    echo "Oto Music Player downloaded"
fi

# Google Camera
if [ -d "vendor/GcamMGC" ]
then
    git -C vendor/GcamMGC pull 2>&1 | grep "fatal"
else
    git clone $GCAM vendor/GcamMGC 2>&1 | grep "fatal"
    echo "Google Camera downloaded"
fi

# Pull DeviceTree Changes
    git -C device/xiaomi/raphael pull 2>&1 | grep "fatal"

# Enable OTA for unofficial Bliss builds
sed -i 's+https://downloads.blissroms.org/api/v1/updater/los/{device}/{variant}/+https://raw.githubusercontent.com/Peam269/ota/master/bliss/{variant}/{device}.json+g' packages/apps/BlissUpdater/res/values/strings.xml


# Create file after initial setup
touch initialsetup > /dev/null 2>&1
