macro(GENModuleCMake target)
    execute_process(COMMAND make print -f ${CMAKE_SOURCE_DIR}/cmake/Makefile target=${target} -C ${MODULE_PATH}/${target} RESULT_VARIABLE result)
    message(STATUS Getting ${target} module file result:${result})
endmacro(GENModuleCMake target)

set(MODULE_PATH ${CMAKE_SOURCE_DIR}/src/modules)

add_subdirectory(${CMAKE_SOURCE_DIR}/src/modules/core)

set_target_properties(libmltcore PROPERTIES FOLDER mlt/modules)