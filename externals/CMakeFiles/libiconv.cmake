include_directories(${EXTERNAL_LIBS}/libiconv
                    ${EXTERNAL_LIBS}/libiconv/source/include
                    ${EXTERNAL_LIBS}/libiconv/source
                    ${EXTERNAL_LIBS}/libiconv/source/lib)

file(GLOB HEADERS ${EXTERNAL_LIBS}/libiconv/source/config.h
                ${EXTERNAL_LIBS}/libiconv/source/include/iconv.h
                ${EXTERNAL_LIBS}/libiconv/source/lib/localcharset.h)
file(GLOB SRCS ${EXTERNAL_LIBS}/libiconv/source/lib/iconv.c
                ${EXTERNAL_LIBS}/libiconv/source/libcharset/lib/localcharset.c
                ${EXTERNAL_LIBS}/libiconv/source/lib/relocatable.c)

add_library(libiconv STATIC ${SRCS} ${HEADERS})
set_target_properties(libiconv PROPERTIES OUTPUT_NAME "iconv")

add_definitions(-DBUILDING_LIBICONV /D"ENABLE_RELOCATABLE=1" -DIN_LIBRARY -DNO_XMALLOC -D_UNICODE -DUNICODE /D"LIBDIR=/")
