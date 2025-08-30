LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ng_gl4es
LOCAL_DESCRIPTION := Krypton Wrapper 0.4.1

# Source files - fixed line continuation issues
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
    src/gl/samplers.c

# Include paths
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/src

# Compiler flags with LTO
LOCAL_CFLAGS := \
    -DANDROID \
    -DNOX11 \
    -DNO_GBM \
    -DNO_EGL \
    -DUSE_ES2 \
    -DNO_INIT_CONSTRUCTOR \
    -DNO_STATIC_EXTERN \
    -DHAVE_LIBDL=1 \
    -fvisibility=hidden \
    -ffunction-sections \
    -fdata-sections \
    -flto

# C++ specific flags for the .cpp file
LOCAL_CPPFLAGS := $(LOCAL_CFLAGS)
LOCAL_CPP_EXTENSION := .cpp

# Linker flags with LTO
LOCAL_LDFLAGS := -Wl,--gc-sections -flto

# Shared libraries
LOCAL_SHARED_LIBRARIES := \
    libdl \
    liblog \
    libEGL \
    libGLESv2

# Build as shared library
include $(BUILD_SHARED_LIBRARY)