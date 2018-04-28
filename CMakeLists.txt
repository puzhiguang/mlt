include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/)

project(MltFramework)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(EXTERNAL_LIBS ${CMAKE_CURRENT_SOURCE_DIR}/externals)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

if(WIN32)
    include_external_msproject(libpthreadwin32 ${EXTERNAL_LIBS}/pthread-win32/pthread.2017.vcxproj)
    include_external_msproject(libdlfcn ${EXTERNAL_LIBS}/dlfcn-win32/visual-studio/17/dl/dl.vcxproj)
    include_external_msproject(libiconv ${EXTERNAL_LIBS}/libiconv/MSVC15/libiconv_dll/libiconv_dll.vcxproj)    
    set_target_properties(libpthreadwin32 libdlfcn libiconv PROPERTIES FOLDER external)
endif()

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/framework)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/mlt++)