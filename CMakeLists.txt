project(MltFramework)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if (CMAKE_SYSTEM_PROCESSOR MATCHES "(x86)|(X86)|(amd64)|(AMD64)")
    set (X86 TRUE)
else()
    set (X86 FALSE)
endif(CMAKE_SYSTEM_PROCESSOR MATCHES "(x86)|(X86)|(amd64)|(AMD64)")

if(CMAKE_C_FLAGS_DEBUG MATCHES "/RTC1")
   string(REPLACE "/RTC1" " " CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}")
endif()
if(CMAKE_CXX_FLAGS_DEBUG MATCHES "/RTC1")
   string(REPLACE "/RTC1" " " CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
endif()

set(EXTERNAL_LIBS ${CMAKE_CURRENT_SOURCE_DIR}/externals)
set(MODULE_LIB_DEST_PATH "lib/mlt")
set(MODULE_LIB_SHARE_PATH "share/mlt")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

if(WIN32)
    add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/win32)
    add_subdirectory(${EXTERNAL_LIBS}/dlfcn-win32)
    set_target_properties(libpthreadwin32 dl libiconv PROPERTIES FOLDER externals)
endif()

add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/)
set(SDL_STATIC FALSE)
add_subdirectory(${EXTERNAL_LIBS}/sdl2)
set_target_properties(SDL2 PROPERTIES FOLDER externals)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/framework)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/mlt++)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/examples)

set_target_properties(libmlt libmlt++ PROPERTIES FOLDER mlt)

# modules 
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/modules/)
