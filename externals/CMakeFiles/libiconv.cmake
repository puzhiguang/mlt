file(GLOB HEADERS ${EXTERNAL_LIBS}/libiconv/source/config.h
                ${EXTERNAL_LIBS}/libiconv/source/include/iconv.h
                ${EXTERNAL_LIBS}/libiconv/source/lib/localcharset.h)
file(GLOB SRCS ${EXTERNAL_LIBS}/libiconv/source/lib/iconv.c
                ${EXTERNAL_LIBS}/libiconv/source/libcharset/lib/localcharset.c
                ${EXTERNAL_LIBS}/libiconv/source/lib/relocatable.c)

add_library(libiconv SHARED ${SRCS} ${HEADERS})
set_target_properties(libiconv PROPERTIES OUTPUT_NAME "iconv")

target_compile_definitions(libiconv PRIVATE BUILDING_LIBICONV ENABLE_RELOCATABLE=1 IN_LIBRARY NO_XMALLOC _UNICODE UNICODE LIBDIR=/)
target_include_directories(libiconv PRIVATE ${EXTERNAL_LIBS}/libiconv
                                            ${EXTERNAL_LIBS}/libiconv/source/include
                                            ${EXTERNAL_LIBS}/libiconv/source
                                            ${EXTERNAL_LIBS}/libiconv/source/lib)
