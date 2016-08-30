LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# Important: keep empty
LOCAL_OBJS_TO_REMOVE := 

# Those are not affecting .so size
LOCAL_OBJS_TO_REMOVE := \
	log2_tab.o golomb_tab.o \
	oggparsedirac.o  \
	oggparsecelt.o   \
	oggparsetheora.o \
	oggparsevp8.o \
	flac_picture.o \
	img2.o \
	replaygain.o \

#	img2.o \
    mux.o                \
    sdp.o                \
    subtitles.o          \

# if --disable-network enabled, line below can be uncommented
#
# LOCAL_OBJS_TO_REMOVE += oggparseogm.o    \
	oggparsespeex.o  \
	avlanguage.o \
	mux.o \

#LOCAL_USE_LOCAL_MAKEFILE := yes
include $(LOCAL_PATH)/../av.mk

LOCAL_SRC_FILES := $(FFFILES) 

# Important: keep LOCAL_PATH paths above ffmpeg path to ensure it overrides sources/headers.
LOCAL_C_INCLUDES :=		\
	$(LOCAL_PATH)		\
	$(LOCAL_PATH)/..	\
	$(FFMPEG_LOCAL_PATH)		\
	$(FFMPEG_LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../../opus-1.0.1/include
	
LOCAL_CFLAGS += $(GLOBAL_CFLAGS)
LOCAL_CFLAGS += -include "string.h" -Dipv6mr_interface=ipv6mr_ifindex

LOCAL_STATIC_LIBRARIES := $(FFLIBS)

LOCAL_MODULE := $(FFNAME)

include $(BUILD_STATIC_LIBRARY)
