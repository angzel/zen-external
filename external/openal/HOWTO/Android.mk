TARGET_PLATFORM := android-9
ROOT_PATH := $(call my-dir)


########################################################################################################
include $(CLEAR_VARS)

OPENAL_ROOT      := $(ROOT_PATH)/../..

$(warning OpenAL Root = $(OPENAL_ROOT))

LOCAL_MODULE     := openal
LOCAL_ARM_MODE   := arm
LOCAL_PATH       := $(ROOT_PATH)

LOCAL_C_INCLUDES := $(LOCAL_PATH)                          \
                    $(OPENAL_ROOT)                         \
                    $(OPENAL_ROOT)/include                     \
                    $(OPENAL_ROOT)/Alc                         \
                    $(OPENAL_ROOT)/OpenAL32                \
                    $(OPENAL_ROOT)/OpenAL32/Include

LOCAL_SRC_FILES  := \
$(OPENAL_ROOT)/Alc/backends/opensl.c \
$(OPENAL_ROOT)/Alc/backends/wave.c \
$(OPENAL_ROOT)/Alc/backends/android.c \
$(OPENAL_ROOT)/Alc/backends/null.c \
$(OPENAL_ROOT)/Alc/backends/loopback.c \
$(OPENAL_ROOT)/Alc/ALc.c \
$(OPENAL_ROOT)/Alc/alcReverb.c \
$(OPENAL_ROOT)/Alc/mixer.c \
$(OPENAL_ROOT)/Alc/alcConfig.c \
$(OPENAL_ROOT)/Alc/ALu.c \
$(OPENAL_ROOT)/Alc/alcDedicated.c \
$(OPENAL_ROOT)/Alc/alcModulator.c \
$(OPENAL_ROOT)/Alc/bs2b.c \
$(OPENAL_ROOT)/Alc/hrtf_tables.inc \
$(OPENAL_ROOT)/Alc/helpers.c \
$(OPENAL_ROOT)/Alc/alcThread.c \
$(OPENAL_ROOT)/Alc/hrtf.c \
$(OPENAL_ROOT)/Alc/alcRing.c \
$(OPENAL_ROOT)/Alc/alcEcho.c \
$(OPENAL_ROOT)/Alc/panning.c \
$(OPENAL_ROOT)/OpenAL32/alExtension.c \
$(OPENAL_ROOT)/OpenAL32/alError.c \
$(OPENAL_ROOT)/OpenAL32/alListener.c \
$(OPENAL_ROOT)/OpenAL32/alSource.c \
$(OPENAL_ROOT)/OpenAL32/alBuffer.c \
$(OPENAL_ROOT)/OpenAL32/alAuxEffectSlot.c \
$(OPENAL_ROOT)/OpenAL32/alFilter.c \
$(OPENAL_ROOT)/OpenAL32/alEffect.c \
$(OPENAL_ROOT)/OpenAL32/alThunk.c \
$(OPENAL_ROOT)/OpenAL32/alState.c \


LOCAL_CFLAGS     := -DAL_BUILD_LIBRARY \
                    -DAL_ALEXT_PROTOTYPES \
                    -DANDROID \
                    -fpic \
                    -ffunction-sections \
                    -funwind-tables \
                    -fstack-protector \
                    -fno-short-enums \
                    -DHAVE_GCC_VISIBILITY \
                    -O3 \
                    -mfpu=neon \
                    -mfloat-abi=softfp \
                    -march=armv7-a \
                    -ffast-math \
                    -std=c99 \

LOCAL_LDLIBS     := -lOpenSLES -llog
LOCAL_ARM_NEON := true

#LOCAL_STATIC_LIBRARIES := libtremolo

include $(BUILD_STATIC_LIBRARY)

