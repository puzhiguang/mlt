include_directories(${EXTERNAL_LIBS}/ffmpeg)
if(WIN32)
    include_directories(${EXTERNAL_LIBS}/win32
                        ${EXTERNAL_LIBS}/ffmpeg/compat/atomics/win32)
endif(WIN32)

set(target "libavutil")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/${target}/*.h ${EXTERNAL_LIBS}/ffmpeg/*.h)

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
endforeach(src )

add_definitions(-DHAVE_AV_CONFIG_H)

add_library(libavutil SHARED ${SRCS} ${HEADERS} ${X86FILES})
set_target_properties(libavutil PROPERTIES OUTPUT_NAME "avutil")

if(WIN32)
    GEN_DEF_COMMAND(${target} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
    SET_TARGET_PROPERTIES(${target} PROPERTIES LINK_FLAGS -DEF:${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
endif(WIN32)

if(APPLE)
    find_library(COREVIDEO_LIB CoreVideo)
    target_link_libraries(libavutil ${COREVIDEO_LIB})
endif(APPLE)