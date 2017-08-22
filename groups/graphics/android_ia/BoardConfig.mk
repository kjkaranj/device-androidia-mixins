BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.atomic=1 i915.nuclear_pageflip=1 drm.vblankoffdelay=1 i915.fastboot=1 i915.enable_slpc=1 i915.enable_guc_loading=2 i915.enable_guc_submission=2
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_INTEL_UFO_DRIVER := false
INTEL_VA := true
BOARD_GRAPHIC_IS_GEN := true
BOARD_GPU_DRIVERS := i965
BOARD_USE_MESA := true
LIBDRM_VER := intel

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

BOARD_GPU_DRIVERS ?= i965 swrast
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
endif

{{#drmhwc}}
BOARD_USES_DRM_HWCOMPOSER := true
BOARD_USES_IA_HWCOMPOSER := false
BOARD_USES_IA_PLANNER := true
{{/drmhwc}}

{{^drmhwc}}
BOARD_USES_DRM_HWCOMPOSER := false
BOARD_USES_IA_HWCOMPOSER := true
{{/drmhwc}}

{{#minigbm}}
BOARD_USES_MINIGBM := true
BOARD_ENABLE_EXPLICIT_SYNC := true
INTEL_MINIGBM := external/minigbm
{{/minigbm}}

{{^minigbm}}
BOARD_USES_MINIGBM := false
BOARD_ENABLE_EXPLICIT_SYNC := false
INTEL_DRM_GRALLOC := external/drm_gralloc/
{{/minigbm}}

{{#gralloc1}}
BOARD_USES_GRALLOC1 := true
{{/gralloc1}}

{{^gralloc1}}
BOARD_USES_GRALLOC1 := false
{{/gralloc1}}

{{#hwc2}}
TARGET_USES_HWC2 := true
{{/hwc2}}

{{^hwc2}}
TARGET_USES_HWC2 := false
{{/hwc2}}
