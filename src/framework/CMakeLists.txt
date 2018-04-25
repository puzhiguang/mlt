if(WIN32)
    include_directories(${EXTERNAL_LIBS}/win32/
                        ${EXTERNAL_LIBS}/pthread-win32/
                        ${EXTERNAL_LIBS}/dlfcn-win32/
                        ${EXTERNAL_LIBS}/libiconv/source/include)
endif()

file(GLOB HEADERS "*.h")
file(GLOB SRCS "*.c")
if(WIN32)
    file(GLOB WIN32SRCS ${CMAKE_CURRENT_SOURCE_DIR}../../win32/win32.c)
endif()

add_library(libmlt SHARED ${HEADERS} ${SRCS} ${WIN32SRCS})
set_target_properties(libmlt PROPERTIES FOLDER core)
    
if(WIN32)
    add_dependencies(libmlt libpthreadwin32 libdlfcn libiconv)
endif()