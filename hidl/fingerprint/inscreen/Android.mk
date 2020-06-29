#
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
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    FingerprintInscreen.cpp \
    service.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libhardware \
    libhidlbase \
    libhidltransport \
    liblog \
    libhwbinder \
    libutils \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0 \
    vendor.samsung.hardware.biometrics.fingerprint@3.0

LOCAL_REQUIRED_MODULES := \
    vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung.rc

LOCAL_MODULE := vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung-sm8250
LOCAL_MODULE_STEM := vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := samsung

LOCAL_POST_INSTALL_CMD := mkdir -p $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64
LOCAL_POST_INSTALL_CMD += ; touch $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/lib64/vendor.lineage.biometrics.fingerprint.inscreen@1.0.so

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/init

LOCAL_SRC_FILES := $(LOCAL_MODULE)

include $(BUILD_PREBUILT)
