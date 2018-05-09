include_directories(${EXTERNAL_LIBS}/ffmpeg)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libswscale/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libswscale/*.h)

list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswscale/bayer_template.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswscale/rgb2rgb_template.c)

add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libswscale STATIC ${SRCS} ${HEADERS})
set_target_properties(libswscale PROPERTIES OUTPUT_NAME "swscale")