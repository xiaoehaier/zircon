# Copyright 2016 The Fuchsia Authors
#
# Use of this source code is governed by a MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT

LOCAL_DIR := $(GET_LOCAL_DIR)

PLATFORM := generic-arm

MEMBASE := 0x00000000
KERNEL_LOAD_OFFSET := 0x00080000
MEMSIZE ?= 0x20000000 # Limit to 512MB for now (GPU uses 1/2 of the 1GB total)

PERIPH_BASE_PHYS := 0x3f000000U
PERIPH_BASE_VIRT := 0xffffffffc0000000UL
PERIPH_SIZE      := 0x40000000U         # 1GB
MEMORY_APERTURE_SIZE := 0x780000000UL   # (30ULL * 1024 * 1024 * 1024)

# reserve the first 64k of ram, which should be holding the fdt
BOOTLOADER_RESERVE_START := 0
BOOTLOADER_RESERVE_SIZE := 0x80000

KERNEL_DEFINES += \
	PERIPH_BASE_PHYS=$(PERIPH_BASE_PHYS) \
	PERIPH_BASE_VIRT=$(PERIPH_BASE_VIRT) \
	PERIPH_SIZE=$(PERIPH_SIZE) \
	MEMORY_APERTURE_SIZE=$(MEMORY_APERTURE_SIZE) \
	BOOTLOADER_RESERVE_START=$(BOOTLOADER_RESERVE_START) \
	BOOTLOADER_RESERVE_SIZE=$(BOOTLOADER_RESERVE_SIZE) \
	PLATFORM_SUPPORTS_PANIC_SHELL=1 \
	BCM2837=1 \

PLATFORM_VID := 0xBC
PLATFORM_PID := 1
PLATFORM_BOARD_NAME := rpi3

MDI_SRCS += $(LOCAL_DIR)/rpi3.mdi
