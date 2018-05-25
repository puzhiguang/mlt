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

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${MODULE_PATH}/${target}/${src})
endforeach(src )

add_compile_options(-D_USE_MATH_DEFINES)
add_library(libmltcore SHARED ${SRCS} ${HEADERS})
set_target_properties(libmltcore PROPERTIES OUTPUT_NAME "libmltcore")
target_link_libraries(libmltcore libmlt)

if(WIN32)
    target_link_libraries(libmltcore libpthreadwin32 libiconv)
endif(WIN32)