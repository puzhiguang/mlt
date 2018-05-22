include_directories(${EXTERNAL_LIBS}/ffmpeg)

set(target "libavformat")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/${target}/*.h)

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
endforeach(src )


add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libavformat SHARED ${SRCS} ${HEADERS})
set_target_properties(libavformat PROPERTIES OUTPUT_NAME "avformat")

target_link_libraries(libavformat libavutil libavcodec ${BZIP2_LIBRARIES})

if(APPLE)
    find_package(BZip2)
    find_library(SECURITY_LIB Security)
    target_link_libraries(libavformat ${BZIP2_LIBRARIES} ${SECURITY_LIB})
endif(APPLE)
    