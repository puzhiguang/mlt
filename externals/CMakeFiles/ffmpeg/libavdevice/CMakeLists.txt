include_directories(${EXTERNAL_LIBS}/ffmpeg)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavdevice/*.h ${EXTERNAL_LIBS}/ffmpeg/*.h)

if(WIN32)
    file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libavdevice/file_open.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/reverse.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow_crossbar.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow_enummediatypes.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow_enumpins.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow_filter.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow_pin.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/dshow_common.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/gdigrab.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/lavfi.c
                    ${EXTERNAL_LIBS}/ffmpeg/libavdevice/vfwcap.c)
endif(WIN32)

add_definitions(-DHAVE_AV_CONFIG_H)

add_library(libavdevice SHARED ${SRCS} ${HEADERS})
set_target_properties(libavdevice PROPERTIES OUTPUT_NAME "avdevice")