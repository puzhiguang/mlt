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
add_compile_options(-DUSE_MMX -DUSE_SSE -DUSE_SSE2 -O2)
set(target "libmlt")
add_library(libmlt SHARED ${HEADERS} ${SRCS})

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