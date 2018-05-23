include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..
				${CMAKE_CURRENT_SOURCE_DIR}/../mlt++)

if(WIN32)
    include_directories(${EXTERNAL_LIBS}/pthread-win32/)
    add_definitions(/D"MLTPP_EXPORTS")
endif(WIN32)

file(GLOB SRCS "*.cpp")

add_executable(play_demo ${SRCS})
add_dependencies(play_demo libmlt++)
target_link_libraries(play_demo libmlt++)
if(WIN32)
    target_link_libraries(play_demo libpthreadwin32 dl libiconv)
endif(WIN32)