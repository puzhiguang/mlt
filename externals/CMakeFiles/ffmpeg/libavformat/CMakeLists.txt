include_directories(${EXTERNAL_LIBS}/ffmpeg
                    ${EXTERNAL_LIBS}/ffmpeg/libavutil)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavformat/avformat.h 
                ${EXTERNAL_LIBS}/ffmpeg/libavformat/avio.h 
                ${EXTERNAL_LIBS}/ffmpeg/libavformat/version.h )

add_library(libavformat STATIC ${SRCS} ${HEADERS})
set_target_properties(libavformat PROPERTIES OUTPUT_NAME "avformat")