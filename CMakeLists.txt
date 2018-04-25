include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/)

project(MltFramework)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if(WIN32)
	set(CMAKE_C_FLAGS "-std=c99 ${CMAKE_C_FLAGS}")
	set(CMAKE_CXX_FLAGS "-std=c99 ${CMAKE_CXX_FLAGS}")
endif()

set(EXTERNAL_LIBS ${CMAKE_CURRENT_SOURCE_DIR}/externals)

if(WIN32)
    include_external_msproject(libpthreadwin32 ${EXTERNAL_LIBS}/pthread-win32/pthread.2017.vcxproj)
    include_external_msproject(libdlfcn ${EXTERNAL_LIBS}/dlfcn-win32/visual-studio/17/dl/dl.vcxproj)
    include_external_msproject(libiconv ${EXTERNAL_LIBS}/libiconv/MSVC15/libiconv_dll/libiconv_dll.vcxproj)    
    set_target_properties(libpthreadwin32 libdlfcn libiconv PROPERTIES FOLDER external)
endif()

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/framework)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/mlt++)