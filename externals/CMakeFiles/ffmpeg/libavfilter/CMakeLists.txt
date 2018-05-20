include_directories(${EXTERNAL_LIBS}/ffmpeg)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libavfilter/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavfilter/*.h ${EXTERNAL_LIBS}/ffmpeg/*.h)

list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavfilter/af_bs2b.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/af_ladspa.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/af_rubberband.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/af_sofalizer.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/asrc_flite.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/af_lv2.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/f_zmq.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_deinterlace_qsv.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_drawtext.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_frei0r.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_libopencv.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_libvmaf.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_ocr.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_scale_cuda.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_scale_npp.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_scale_qsv.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_subtitles.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_vidstabdetect.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vidstabutils.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_vpp_qsv.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_overlay_opencl.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_zscale.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_vidstabtransform.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_thumbnail_cuda.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_unsharp_opencl.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_procamp_vaapi.c                    
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_program_opencl.c                    
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_scale_vaapi.c                    
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/scale.c                    
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_hwupload_cuda.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_overlay_qsv.c                    
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/framesync.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_misc_vaapi.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/qsvvpp.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_deinterlace_vaapi.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/colorspacedsp_template.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/colorspacedsp_yuv2yuv_template.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/opencl.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vaapi_vpp.c
                    )

add_definitions(-DHAVE_AV_CONFIG_H)

add_library(libavfilter SHARED ${SRCS} ${HEADERS} ${ASMS})
set_target_properties(libavfilter PROPERTIES OUTPUT_NAME "avfilter")
target_link_libraries(libavfilter libavutil libavcodec libavformat libswresample)
