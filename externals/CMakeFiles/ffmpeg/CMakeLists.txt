macro(GENCMake target)
    execute_process(COMMAND make print target=${target} -C ${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/Files/ RESULT_VARIABLE result)
    message(STATUS Getting ${target} source file result:${result})
endmacro(GENCMake target)

macro(GEN_DEF_COMMAND target outdef)
    add_custom_command(TARGET ${target} PRE_LINK COMMAND 
                        set EXTERN_PREFIX=_
                        COMMAND
                        sh ${EXTERNAL_LIBS}/ffmpeg/compat/windows/makedef ${EXTERNAL_LIBS}/ffmpeg/${target}/${target}.v *.obj > ${outdef}
                        WORKING_DIRECTORY $(IntDir)
                        COMMENT "Add .def file generation pre-link event")
endmacro(GEN_DEF_COMMAND target outdef)

if(CMAKE_C_FLAGS_DEBUG MATCHES "/RTC1")
   string(REPLACE "/RTC1" " " CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}")
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Debug/${MODULE_LIB_DEST_PATH})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/Release/${MODULE_LIB_DEST_PATH})

add_compile_options(-O2 -DNDEBUG)

add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libavutil)
add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libswresample)
add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libavformat)
add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libavcodec)
add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libswscale)
add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libavfilter)
add_subdirectory(${EXTERNAL_LIBS}/CMakeFiles/ffmpeg/libavdevice)
set_target_properties(libavutil libavcodec libavformat libswscale libswresample libavfilter libavdevice PROPERTIES FOLDER externals/ffmpeg/)

if(WIN32)
    add_compile_options(-nologo -Z7 -W3 -wd4018 -wd4146 -wd4244 -wd4305 -wd4554 -Oy- -utf-8)
endif(WIN32)
