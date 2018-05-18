file(GLOB HEADERS ${EXTERNAL_LIBS}/pthread-win32/*.h)
file(GLOB SRCS ${EXTERNAL_LIBS}/pthread-win32/*.c)

list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/pthread-win32/pthread.c)

add_library(libpthreadwin32 SHARED ${SRCS} ${HEADERS})
set_target_properties(libpthreadwin32 PROPERTIES OUTPUT_NAME "pthread-win32")

target_compile_definitions(libpthreadwin32 PRIVATE HAVE_CONFIG_H PTW32_BUILD)

target_include_directories(libpthreadwin32 PRIVATE ${EXTERNAL_LIBS}/pthread-win32)