LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(call import-add-path,$(LOCAL_PATH)/../../cocos2d)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/external)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos/audio/include)

LOCAL_MODULE := MyGame_shared

LOCAL_MODULE_FILENAME := libMyGame


# For source file and header file in Classes and sub-Classes folder
ifeq ($(HOST_OS),windows)
    CPP_FILES := $(shell dir "$(LOCAL_PATH)/../../Classes/" /b /s /a-d | find ".cpp")
else
    CPP_FILES := $(shell find $(LOCAL_PATH)/../../Classes -name *.cpp)
endif
LOCAL_SRC_FILES := hellocpp/main.cpp
LOCAL_SRC_FILES += $(CPP_FILES:$(LOCAL_PATH)/%=%)

ifeq ($(HOST_OS),windows)
    LOCAL_DIRS := $(shell dir "$(LOCAL_PATH)/../../Classes" /b /s /ad)
else
    LOCAL_DIRS := $(shell find $(LOCAL_PATH)/../../Classes -type d)
endif
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
LOCAL_C_INCLUDES += $(LOCAL_DIRS:$(LOCAL_PATH)/%=%)

# For App42 and sub-App42 folder
ifeq ($(HOST_OS),windows)
    APP42_APPS := $(shell dir "$(LOCAL_PATH)/../../App42/" /b /s /a-d | find ".cpp")
else
    APP42_APPS := $(shell find $(LOCAL_PATH)/../../App42 -name *.cpp)
endif
LOCAL_SRC_FILES += $(APP42_APPS:$(LOCAL_PATH)/%=%)

ifeq ($(HOST_OS),windows)
    APP42_LOCAL_DIRS := $(shell dir "$(LOCAL_PATH)/../../App42" /b /s /ad)
else
    APP42_LOCAL_DIRS := $(shell find $(LOCAL_PATH)/../../App42 -type d)
endif
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../App42
LOCAL_C_INCLUDES += $(APP42_LOCAL_DIRS:$(LOCAL_PATH)/%=%)


# For Tests folder
ifeq ($(HOST_OS),windows)
    TESTS_CPPS := $(shell dir "$(LOCAL_PATH)/../../Tests/" /b /s /a-d | find ".cpp")
else
    TESTS_CPPS := $(shell find $(LOCAL_PATH)/../../Tests -name *.cpp)
endif
LOCAL_SRC_FILES += $(TESTS_CPPS:$(LOCAL_PATH)/%=%)

ifeq ($(HOST_OS),windows)
    TESTS_LOCAL_DIRS := $(shell dir "$(LOCAL_PATH)/../../Tests" /b /s /ad)
else
    TESTS_LOCAL_DIRS := $(shell find $(LOCAL_PATH)/../../Tests -type d)
endif
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Tests
LOCAL_C_INCLUDES += $(TESTS_LOCAL_DIRS:$(LOCAL_PATH)/%=%)



# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END


LOCAL_STATIC_LIBRARIES := cocos2dx_static

# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)

$(call import-module,.)
$(call import-module,curl/prebuilt/android)

# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
