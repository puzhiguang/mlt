project(MLTFramework)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
if(WIN32)
	set(CMAKE_C_FLAGS "-std=c99 ${CMAKE_C_FLAGS}")
	set(CMAKE_CXX_FLAGS "-std=c99 ${CMAKE_CXX_FLAGS}")
endif()

set(EXTERNAL_LIBS ${CMAKE_CURRENT_SOURCE_DIR}../../../externals/)
if(WIN32)
    include_directories(${CMAKE_CURRENT_SOURCE_DIR}../../../externals/win32/
                        ${CMAKE_CURRENT_SOURCE_DIR}../../../externals/pthread-win32/
                        ${CMAKE_CURRENT_SOURCE_DIR}../../../externals/dlfcn-win32/)
endif()

#pthread lib
if(WIN32)
    include_external_msproject(libpthreadwin32 ${EXTERNAL_LIBS}pthread-win32/pthread.2017.vcxproj)
    include_external_msproject(libdlfcn ${EXTERNAL_LIBS}dlfcn-win32/visual-studio/17/dl/dl.vcxproj)
    set_target_properties(libpthreadwin32 PROPERTIES FOLDER external)
    set_target_properties(libdlfcn PROPERTIES FOLDER external)
endif()

file(GLOB HEADERS "*.h")
file(GLOB SRCS "*.c")
if(WIN32)
    file(GLOB WIN32SRCS ${CMAKE_CURRENT_SOURCE_DIR}../../win32/win32.c)
endif()

add_library(libmlt SHARED ${HEADERS} ${SRCS} ${WIN32SRCS})
set_target_properties(libmlt PROPERTIES FOLDER core)
    
if(WIN32)
    add_dependencies(libmlt libpthreadwin32)
    add_dependencies(libmlt libdlfcn)
endif()