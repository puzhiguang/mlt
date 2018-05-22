include_directories(${EXTERNAL_LIBS}/ffmpeg)

set(target "libswresample")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/${target}/*.h)

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
endforeach(src )


add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libswresample SHARED ${SRCS} ${HEADERS})
set_target_properties(libswresample PROPERTIES OUTPUT_NAME "swresample")
target_link_libraries(libswresample libavutil)