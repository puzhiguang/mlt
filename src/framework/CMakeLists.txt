if(WIN32)
    include_directories(${EXTERNAL_LIBS}/win32/
                        ${EXTERNAL_LIBS}/pthread-win32/
                        ${EXTERNAL_LIBS}/dlfcn-win32/
                        ${EXTERNAL_LIBS}/libiconv/source/include)
endif(WIN32)

set(MLT_SHARE_OUTPUT_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_CFG_INTDIR}/${MODULE_LIB_SHARE_PATH})

file(GLOB HEADERS "*.h")
file(GLOB SRCS "*.c")
if(WIN32)
    list(APPEND SRCS ${CMAKE_CURRENT_SOURCE_DIR}../../win32/win32.c)
endif(WIN32)

#profiles 
file(GLOB PROFILES ${CMAKE_CURRENT_SOURCE_DIR}/../../profiles/*)
list(REMOVE_ITEM PROFILES ${CMAKE_CURRENT_SOURCE_DIR}/../../profiles/Makefile)
source_group("profiles" FILES ${PROFILES})

add_compile_options(-DUSE_MMX -DUSE_SSE -DUSE_SSE2 -O2)
set(target "libmlt")
add_library(libmlt SHARED ${HEADERS} ${SRCS} ${PROFILES})

add_custom_command(TARGET ${target} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E make_directory ${MLT_SHARE_OUTPUT_DIR}/profiles
                        COMMAND ${CMAKE_COMMAND} -E copy ${PROFILES} ${MLT_SHARE_OUTPUT_DIR}/profiles)

if(WIN32)
	add_dependencies(libmlt libpthreadwin32 dl libiconv)
    target_link_libraries(libmlt libpthreadwin32 dl libiconv)
    add_custom_command(TARGET ${target} PRE_LINK COMMAND 
                        set EXTERN_PREFIX=_
                        COMMAND
                        sh ${EXTERNAL_LIBS}/ffmpeg/compat/windows/makedef ${CMAKE_CURRENT_SOURCE_DIR}/mlt.vers *.obj > ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def
                        WORKING_DIRECTORY $(IntDir)
                        COMMENT "Add .def file generation pre-link event")
    SET_TARGET_PROPERTIES(${target} PROPERTIES LINK_FLAGS -DEF:${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${target}.def)
endif(WIN32)

if(APPLE)
    add_definitions(-DRELOCATABLE)
endif(APPLE)