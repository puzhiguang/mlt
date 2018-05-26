include_directories(${EXTERNAL_LIBS}/ffmpeg
                    ${EXTERNAL_LIBS}/ffmpeg/libavcodec)
if(WIN32)
    include_directories(${EXTERNAL_LIBS}/ffmpeg/compat/atomics/win32)
endif(WIN32)

if(APPLE)
    find_package(LibLZMA)
    find_package(ZLIB)
    find_package(Iconv)
    include_directories(${LIBLZMA_INCLUDE_DIRS} ${ZLIB_INCLUDE_DIRS} ${Iconv_INCLUDE_DIRS})
endif(APPLE)

set(target "libavcodec")
GENCMake(${target})

include(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/${target}.cmake)

file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/${target}/*.h)

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${EXTERNAL_LIBS}/ffmpeg/${target}/${src})
endforeach(src )

add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libavcodec SHARED ${SRCS} ${HEADERS})
set_target_properties(libavcodec PROPERTIES OUTPUT_NAME "avcodec")

target_link_libraries(libavcodec libavutil libswresample)

if(WIN32)
    GEN_DEF_COMMAND(${target} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
    SET_TARGET_PROPERTIES(${target} PROPERTIES LINK_FLAGS -DEF:${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
endif(WIN32)

if(APPLE)
    find_library(VIDEOTOOLBOX_LIB VideoToolbox)
    find_library(AUDIOTOOLBOX_LIB AudioToolbox)
    find_library(COREFOUNDATION_LIB CoreFoundation)
    find_library(COREMEDIA_LIB CoreMedia)
    target_link_libraries(libavcodec ${VIDEOTOOLBOX_LIB} ${AUDIOTOOLBOX_LIB} ${COREFOUNDATION_LIB} ${COREMEDIA_LIB} ${LIBLZMA_LIBRARIES} ${ZLIB_LIBRARIES} ${Iconv_LIBRARIES})
endif(APPLE)