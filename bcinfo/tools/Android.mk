#
# Copyright (C) 2011 The Android Open Source Project
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

LLVM_ROOT_PATH := external/llvm
include $(LLVM_ROOT_PATH)/llvm.mk

# Executable for host
# ========================================================
include $(CLEAR_VARS)

LOCAL_MODULE := bcinfo
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := \
  main.cpp

LOCAL_SHARED_LIBRARIES := \
  libbcinfo

LOCAL_STATIC_LIBRARIES := \
  libLLVMBitReader \
  libLLVMBitWriter \
  libLLVMCore \
  libLLVMSupport

LOCAL_CFLAGS += -D__HOST__

LOCAL_LDLIBS = -ldl -lpthread

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

