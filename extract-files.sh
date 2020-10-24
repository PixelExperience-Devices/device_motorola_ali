#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/hw/camera.msm8953.so)
            sed -i "s|service.bootanim.exit|service.bootanim.hold|g" "${2}"
            ;;
        vendor/lib/hw/audio.primary.msm8953.so)
            "${PATCHELF}" --replace-needed libcutils.so libprocessgroup.so "${2}"
            ;;
        vendor/lib/libmmcamera_vstab_module.so)
            sed -i "s/libgui/libwui/" "${2}"
            ;;
        vendor/lib/libmmcamera2_pproc_modules.so)
            sed -i "s/ro.product.manufacturer/ro.product.nopefacturer/" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=ali
export DEVICE_COMMON=msm8953-common
export VENDOR=motorola

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
