# Inherit common AOGP stuff
$(call inherit-product, vendor/aogp/config/common.mk)

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# Include AOGP audio files
include vendor/aogp/config/aogp_audio.mk

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aogp/overlay/dictionaries

# Optional CM packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    PhaseBeam \
    PhotoTable \
    SoundRecorder \
    PhotoPhase

# Extra tools in CM
PRODUCT_PACKAGES += \
    vim
