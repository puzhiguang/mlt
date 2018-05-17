file(GLOB HEADERS ${EXTERNAL_LIBS}/pthread-win32/*.h)
file(GLOB SRCS ${EXTERNAL_LIBS}/pthread-win32/*.c)

add_library(libpthreadwin32 STATIC ${SRCS} ${HEADERS})
set_target_properties(libpthreadwin32 PROPERTIES OUTPUT_NAME "pthread-win32")

add_definitions(-DHAVE_CONFIG_H -DPTW32_STATIC_LIB)

target_include_directories(libpthreadwin32 PRIVATE ${EXTERNAL_LIBS}/pthread-win32)