if(WIN32)
    include_directories(${EXTERNAL_LIBS}/win32/
                        ${EXTERNAL_LIBS}/pthread-win32/
                        ${EXTERNAL_LIBS}/dlfcn-win32/
                        ${EXTERNAL_LIBS}/libiconv/source/include)
endif(WIN32)

file(GLOB HEADERS "*.h")
file(GLOB SRCS "*.c")
if(WIN32)
    list(APPEND SRCS ${CMAKE_CURRENT_SOURCE_DIR}../../win32/win32.c)
endif(WIN32)

add_library(libmlt SHARED ${HEADERS} ${SRCS})
    
if(WIN32)
	add_dependencies(libmlt libpthreadwin32 dl libiconv)
	target_link_libraries(libmlt libpthreadwin32 dl libiconv)
endif(WIN32)

if(APPLE)
    add_definitions(-DRELOCATABLE)
endif(APPLE)