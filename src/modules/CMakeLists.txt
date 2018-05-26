#GENModuleCMake(target extraflags)
macro(GENModuleCMake)
    set(target ${ARGV0})
    set(extras ${ARGN})
    list(REMOVE_ITEM extras ${target})
    #fake a config.mak file
    file(WRITE ${MODULE_PATH}/${target}/config.mak "")
    execute_process(COMMAND make print -f ${CMAKE_SOURCE_DIR}/cmake/Makefile target=${target} -C ${MODULE_PATH}/${target} ${extras} RESULT_VARIABLE result)
    file(REMOVE ${MODULE_PATH}/${target}/config.mak)
    message(STATUS Getting ${target} module file result:${result})
endmacro(GENModuleCMake)

macro(ADD_FILES_OUTPUT_COMMAND target dest)
    add_custom_command(TARGET ${target} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E make_directory ${MLT_SHARE_OUTPUT_DIR}/${dest}
                        COMMAND ${CMAKE_COMMAND} -E copy ${SHARE_FILES} ${MLT_SHARE_OUTPUT_DIR}/${dest})
endmacro(ADD_FILES_OUTPUT_COMMAND target)

set(MODULE_PATH ${CMAKE_SOURCE_DIR}/src/modules)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${MODULE_LIB_DEST_PATH})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${MODULE_LIB_DEST_PATH})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${MODULE_LIB_DEST_PATH})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${MODULE_LIB_DEST_PATH})

set(MLT_SHARE_OUTPUT_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_CFG_INTDIR}/${MODULE_LIB_SHARE_PATH})

if(WIN32)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
endif(WIN32)

add_subdirectory(${CMAKE_SOURCE_DIR}/src/modules/avformat)
add_subdirectory(${CMAKE_SOURCE_DIR}/src/modules/core)
add_subdirectory(${CMAKE_SOURCE_DIR}/src/modules/sdl2)

set_target_properties(libmltavformat libmltcore libmltsdl2 PROPERTIES FOLDER mlt/modules)