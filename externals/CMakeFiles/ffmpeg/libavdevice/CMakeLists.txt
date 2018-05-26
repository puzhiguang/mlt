include_directories(${EXTERNAL_LIBS}/ffmpeg)

set(target "libavdevice")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/${target}/*.h)

foreach(src ${${target}_SRCS})
    if(EXISTS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
        list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
    else()
        string(REPLACE ".c" ".m" mfile ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
        if(EXISTS ${mfile})
            list(APPEND SRCS ${mfile})
        endif()
    endif()
endforeach(src )

add_definitions(-DHAVE_AV_CONFIG_H)

add_library(libavdevice SHARED ${SRCS} ${HEADERS})
set_target_properties(libavdevice PROPERTIES OUTPUT_NAME "avdevice")
target_link_libraries(libavdevice libavutil libavfilter)

if(WIN32)
    GEN_DEF_COMMAND(${target} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
    SET_TARGET_PROPERTIES(${target} PROPERTIES LINK_FLAGS -DEF:${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
	target_link_libraries(${target} strmiids shlwapi vfw32)
endif(WIN32)

if(APPLE)
    find_library(AVFOUNDATION_LIB AVFoundation)
    target_link_libraries(${target} ${AVFOUNDATION_LIB})
endif(APPLE)