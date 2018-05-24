include_directories(${CMAKE_SOURCE_DIR}/src
                    ${CMAKE_CURRENT_BINARY_DIR})

set(target "core")
GENModuleCMake(${target})

include(${CMAKE_SOURCE_DIR}/cmake/${target}.tmp)

file(GLOB HEADERS ${MODULE_PATH}/${target}/*.h)

foreach(src ${${target}_SRCS})
    list(APPEND SRCS ${MODULE_PATH}/${target}/${src})
endforeach(src )

add_library(libmltcore SHARED ${SRCS} ${HEADERS})
set_target_properties(libmltcore PROPERTIES OUTPUT_NAME "libmltcore")