file(GLOB HEADERS ${EXTERNAL_LIBS}/dlfcn-win32/dlfcn.h)
file(GLOB SRCS ${EXTERNAL_LIBS}/dlfcn-win32/dlfcn.c)

add_library(libdlfcn SHARED ${SRCS} ${HEADERS})
set_target_properties(libdlfcn PROPERTIES OUTPUT_NAME "dlfcn-win32")

target_include_directories(libdlfcn PRIVATE ${EXTERNAL_LIBS}/dlfcn-win32)

target_link_libraries(libdlfcn psapi)