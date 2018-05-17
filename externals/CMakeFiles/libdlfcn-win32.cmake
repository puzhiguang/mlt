include_directories(${EXTERNAL_LIBS}/dlfcn-win32)

file(GLOB HEADERS ${EXTERNAL_LIBS}/dlfcn-win32/dlfcn.h)
file(GLOB SRCS ${EXTERNAL_LIBS}/dlfcn-win32/dlfcn.c)

add_library(libdlfcn STATIC ${SRCS} ${HEADERS})
set_target_properties(libdlfcn PROPERTIES OUTPUT_NAME "dlfcn-win32")
