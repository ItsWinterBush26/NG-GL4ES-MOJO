LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := NG-GL4ES

LOCAL_SRC_FILES := \
    src/gl/string_utils.c \
    src/gl/cJSON.c \
    src/gl/config.c \
    src/gl/arbconverter.c \
    src/gl/arbgenerator.c \
    src/gl/arbhelper.c \
    src/gl/arbparser.c \
    src/gl/array.c \
    src/gl/blend.c \
    src/gl/blit.c \
    src/gl/buffers.c \
    src/gl/build_info.c \
    src/gl/debug.c \
    src/gl/decompress.c \
    src/gl/depth.c \
    src/gl/directstate.c \
    src/gl/drawing.c \
    src/gl/enable.c \
    src/gl/envvars.c \
    src/gl/eval.c \
    src/gl/face.c \
    src/gl/fog.c \
    src/gl/fpe.c \
    src/gl/fpe_cache.c \
    src/gl/fpe_shader.c \
    src/gl/framebuffers.c \
    src/gl/gl_lookup.c \
    src/gl/gl4es.c \
    src/gl/glstate.c \
    src/gl/hint.c \
    src/gl/init.c \
    src/gl/light.c \
    src/gl/line.c \
    src/gl/list.c \
    src/gl/listdraw.c \
    src/gl/listrl.c \
    src/gl/loader.c \
    src/gl/logs.c \
    src/gl/matrix.c \
    src/gl/matvec.c \
    src/gl/oldprogram.c \
    src/gl/pixel.c \
    src/gl/planes.c \
    src/gl/pointsprite.c \
    src/gl/preproc.c \
    src/gl/program.c \
    src/gl/queries.c \
    src/gl/raster.c \
    src/gl/render.c \
    src/gl/shader.c \
    src/gl/shaderconv.c \
    src/gl/shader_hacks.c \
    src/gl/stack.c \
    src/gl/stencil.c \
    src/gl/stubs.c \
    src/gl/texenv.c \
    src/gl/texgen.c \
    src/gl/texture.c \
    src/gl/texture_compressed.c \
    src/gl/texture_params.c \
    src/gl/texture_read.c \
    src/gl/texture_3d.c \
    src/gl/uniform.c \
    src/gl/vertexattrib.c \
    src/gl/wrap/gl4eswraps.c \
    src/gl/wrap/gles.c \
    src/gl/wrap/glstub.c \
    src/gl/wrap/glesnative.cpp \
    src/gl/math/matheval.c \
    src/glx/hardext.c \
    src/glx/lookup.c \
    src/glx/gbm.c \
    src/glx/streaming.c \
    src/gl/vgpu/shaderconv.c \
    src/gl/samplers.c \
    src/gl/glsl/glsl_for_es.cpp \
    src/gl/getter.cpp

LOCAL_CFLAGS    := -fPIC -DNO_GBM -DDEFAULT_ES=3 -fvisibility=hidden
LOCAL_CPPFLAGS  := -fvisibility=hidden
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_LDLIBS := -llog -landroid

LOCAL_STATIC_LIBRARIES := \
    glslang \
    GenericCodeGen \
    glslang-default-resource-limits \
    MachineIndependent \
    OSDependent \
    SPIRV-Tools-diff \
    SPIRV-Tools-link \
    SPIRV-Tools-lint \
    SPIRV-Tools-opt \
    SPIRV-Tools-reduce \
    SPIRV-Tools \
    SPIRV \
    SPVRemapper

LOCAL_SHARED_LIBRARIES := spirv-cross-c-shared

include $(BUILD_SHARED_LIBRARY)

# Prebuilt static libraries
$(foreach lib,glslang GenericCodeGen glslang-default-resource-limits MachineIndependent OSDependent SPIRV-Tools-diff SPIRV-Tools-link SPIRV-Tools-lint SPIRV-Tools-opt SPIRV-Tools-reduce SPIRV-Tools SPIRV SPVRemapper, \
    $(eval include $(CLEAR_VARS) \
    LOCAL_MODULE := $(lib) \
    LOCAL_SRC_FILES := library/android/$(TARGET_ARCH_ABI)/lib$(lib).a \
    include $(PREBUILT_STATIC_LIBRARY)) \
)

# Prebuilt shared library
include $(CLEAR_VARS)
LOCAL_MODULE := spirv-cross-c-shared
LOCAL_SRC_FILES := library/android/$(TARGET_ARCH_ABI)/libspirv-cross-