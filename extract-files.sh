#!/bin/bash
#
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
else
    MY_DIR="${BASH_SOURCE%/*}"
    if [ ! -d "${MY_DIR}" ]; then
        MY_DIR="${PWD}"
    fi
fi

set -e
ROOT="$MY_DIR"/../../..

# Required!
export DEVICE=ali
export DEVICE_COMMON=msm8953-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2018

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

BLOB_ROOT="$ROOT"/vendor/"${VENDOR}"/"${DEVICE}"/proprietary

AUDIO_HAL="$BLOB_ROOT"/vendor/lib/hw/audio.primary.msm8953.so
patchelf --replace-needed libcutils.so libprocessgroup.so "$AUDIO_HAL"
