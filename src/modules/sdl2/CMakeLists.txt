include_directories(${CMAKE_SOURCE_DIR}/src
                    ${CMAKE_CURRENT_BINARY_DIR}
                    ${EXTERNAL_LIBS}/sdl2/include)

if(WIN32)
    include_directories(${EXTERNAL_LIBS}/pthread-win32/
                        ${CMAKE_SOURCE_DIR}/src/win32/
                        ${EXTERNAL_LIBS}/libiconv/source/include
                        ${EXTERNAL_LIBS}/win32/)
	list(APPEND SRCS ${CMAKE_SOURCE_DIR}/src/win32/win32.c)
endif(WIN32)

set(target "sdl2")
GENModuleCMake(${target})

include(${CMAKE_SOURCE_DIR}/cmake/${target}.tmp)

file(GLOB HEADERS ${MODULE_PATH}/${target}/*.h)
file(GLOB SHARE_FILES ${MODULE_PATH}/${target}/*.yml )
source_group(share FILES ${SHARE_FILES})

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${MODULE_PATH}/${target}/${src})
endforeach(src )

list(APPEND SRCS ../sdl/consumer_sdl_audio.c)

add_compile_options(-D_USE_MATH_DEFINES)
add_library(libmltsdl2 SHARED ${SRCS} ${HEADERS} ${SHARE_FILES})
set_target_properties(libmltsdl2 PROPERTIES OUTPUT_NAME "libmltsdl2")
target_link_libraries(libmltsdl2 libmlt SDL2)
ADD_FILES_OUTPUT_COMMAND(libmltsdl2 ${target})

if(WIN32)
    target_link_libraries(libmltsdl2 libpthreadwin32 libiconv)
endif(WIN32)