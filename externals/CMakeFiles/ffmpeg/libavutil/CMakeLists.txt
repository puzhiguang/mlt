include_directories(${EXTERNAL_LIBS}/ffmpeg)
if(WIN32)
    include_directories(${EXTERNAL_LIBS}/win32
                        ${EXTERNAL_LIBS}/ffmpeg/compat/atomics/win32)
endif(WIN32)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libavutil/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavutil/*.h ${EXTERNAL_LIBS}/ffmpeg/*.h)

list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_cuda.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_cuda_internal.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_d3d11va.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_drm.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_dxva2.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_qsv.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_opencl.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_vaapi.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_videotoolbox.c
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_vdpau.c)

list(REMOVE_ITEM HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_cuda.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_cuda_internal.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_d3d11va.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_drm.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_dxva2.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_qsv.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_opencl.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_vaapi.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_videotoolbox.h
                        ${EXTERNAL_LIBS}/ffmpeg/libavutil/hwcontext_vdpau.h)

#if(X86)
#    include_directories(${EXTERNAL_LIBS}/ffmpeg/libavutil/x86)
#    file(GLOB SRCSX86 ${EXTERNAL_LIBS}/ffmpeg/libavutil/X86/*.c)
#    file(GLOB ASMS ${EXTERNAL_LIBS}/ffmpeg/libavutil/X86/*.asm)
#    add_definitions(-DARCH_X86)
#endif(X86)

add_definitions(-DHAVE_AV_CONFIG_H)

add_library(libavutil SHARED ${SRCS} ${HEADERS} ${ASMS})
set_target_properties(libavutil PROPERTIES OUTPUT_NAME "avutil")