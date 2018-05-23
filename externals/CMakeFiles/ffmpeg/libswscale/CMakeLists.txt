include_directories(${EXTERNAL_LIBS}/ffmpeg)

set(target "libswscale")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
endforeach(src )

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libswscale/*.h)

add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libswscale SHARED ${SRCS} ${HEADERS})
set_target_properties(libswscale PROPERTIES OUTPUT_NAME "swscale")
target_link_libraries(libswscale libavutil)

if(WIN32)
    GEN_DEF_COMMAND(${target} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
    SET_TARGET_PROPERTIES(${target} PROPERTIES LINK_FLAGS -DEF:${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
endif(WIN32)