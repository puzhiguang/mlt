include_directories(${EXTERNAL_LIBS}/ffmpeg)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libavcodec/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavcodec/*.h ${EXTERNAL_LIBS}/ffmpeg/*.h)

add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libavcodec STATIC ${SRCS} ${HEADERS})
set_target_properties(libavcodec PROPERTIES OUTPUT_NAME "avcodec")