include_directories(${EXTERNAL_LIBS}/ffmpeg)

set(target "libavfilter")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/${target}/*.h)

foreach(src ${${target}_SRCS})
    if(EXISTS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
        list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
    endif()
endforeach(src )


if(APPLE)
    list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/libavfilter/vf_coreimage.m)
endif(APPLE)

add_definitions(-DHAVE_AV_CONFIG_H)

add_library(libavfilter SHARED ${SRCS} ${HEADERS})
set_target_properties(libavfilter PROPERTIES OUTPUT_NAME "avfilter")
target_link_libraries(libavfilter libavutil libavcodec libavformat libswresample libswscale)

if(WIN32)
    GEN_DEF_COMMAND(${target} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
    SET_TARGET_PROPERTIES(${target} PROPERTIES LINK_FLAGS -DEF:${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
endif(WIN32)

if(APPLE)
    find_library(COREIMAGE_LIB CoreImage)
    find_library(APPKIT_LIB AppKit)
    find_package(OpenGL REQUIRED)
    target_link_libraries(libavfilter ${COREIMAGE_LIB} ${APPKIT_LIB} ${OPENGL_LIBRARIES})
endif(APPLE)
