include_directories(${CMAKE_SOURCE_DIR}/src
                    ${CMAKE_CURRENT_BINARY_DIR})

if(WIN32)
    include_directories(${EXTERNAL_LIBS}/pthread-win32/
						${EXTERNAL_LIBS}/libiconv/source/include
                        ${CMAKE_SOURCE_DIR}/src/win32/
                        ${EXTERNAL_LIBS}/win32/)
	list(APPEND SRCS ${CMAKE_SOURCE_DIR}/src/win32/win32.c)
endif(WIN32)

set(target "core")
GENModuleCMake(${target})

include(${CMAKE_SOURCE_DIR}/cmake/${target}.tmp)

file(GLOB HEADERS ${MODULE_PATH}/${target}/*.h)
file(GLOB SHARE_FILES ${MODULE_PATH}/${target}/*.yml 
                        ${MODULE_PATH}/${target}/data_fx.properties
                        ${MODULE_PATH}/${target}/loader.dict
                        ${MODULE_PATH}/${target}/loader.ini)
source_group(share FILES ${SHARE_FILES})

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${MODULE_PATH}/${target}/${src})
endforeach(src )

add_compile_options(-D_USE_MATH_DEFINES)
add_library(libmltcore SHARED ${SRCS} ${HEADERS} ${SHARE_FILES})
set_target_properties(libmltcore PROPERTIES OUTPUT_NAME "libmltcore")
target_link_libraries(libmltcore libmlt)
add_custom_command(TARGET libmltcore POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E make_directory ${MLT_SHARE_OUTPUT_DIR}/${target}
                    COMMAND ${CMAKE_COMMAND} -E copy ${SHARE_FILES} ${MLT_SHARE_OUTPUT_DIR}/${target})
if(WIN32)
    target_link_libraries(libmltcore libpthreadwin32 libiconv)
endif(WIN32)