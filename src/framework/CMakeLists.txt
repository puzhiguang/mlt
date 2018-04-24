project(MLTFramework)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

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

add_library(libmlt ${HEADERS} ${SRCS})
set_target_properties(libmlt PROPERTIES FOLDER core)
    
if(WIN32)
    add_dependencies(libmlt libpthreadwin32)
    add_dependencies(libmlt libdlfcn)
endif()