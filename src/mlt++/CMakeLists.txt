include_directories(${CMAKE_CURRENT_SOURCE_DIR}
                    ${CMAKE_CURRENT_SOURCE_DIR}/..)
if(WIN32)
    include_directories(${EXTERNAL_LIBS}/pthread-win32/)
endif(WIN32)

file(GLOB HEADERS "*.h")
file(GLOB SRCS "*.cpp")

add_library(libmlt++ SHARED ${HEADERS} ${SRCS})
if(WIN32)
    add_definitions(/D"MLTPP_EXPORTS")
endif(WIN32)

add_dependencies(libmlt++ libmlt)
target_link_libraries(libmlt++ libmlt)