include_directories(${EXTERNAL_LIBS}/ffmpeg)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libswresample/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libswresample/*.h)

list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswresample/dither_template.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswresample/rematrix_template.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswresample/resample_template.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswresample/noise_shaping_data.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libswresample/soxr_resample.c)

add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libswresample SHARED ${SRCS} ${HEADERS})
set_target_properties(libswresample PROPERTIES OUTPUT_NAME "swresample")