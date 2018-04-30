include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../mlt++
                    )

file(GLOB SRCS "*.cpp")

add_executable(play_demo ${SRCS})
add_dependencies(play_demo libmlt++)
target_link_libraries(play_demo libmlt++)