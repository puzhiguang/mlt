include_directories(${EXTERNAL_LIBS}/ffmpeg)

file(GLOB SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/*.c)
file(GLOB HEADERS ${EXTERNAL_LIBS}/ffmpeg/libavformat/avformat.h 
                ${EXTERNAL_LIBS}/ffmpeg/libavformat/avio.h 
                ${EXTERNAL_LIBS}/ffmpeg/libavformat/version.h )

list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/bluray.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/chromaprint.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/dashdec.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/libssh.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/rtmpcrypt.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/librtmp.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/rtmpdh.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/libmodplug.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/libopenmpt.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/sctp.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/libsmbclient.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/tls_openssl.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/tls_schannel.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/tls_gnutls.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/tls_libtls.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/tls_securetransport.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/unix.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/libgme.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/demuxer_list.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/protocol_list.c)
list(REMOVE_ITEM SRCS ${EXTERNAL_LIBS}/ffmpeg/libavformat/muxer_list.c)


add_definitions(-DHAVE_AV_CONFIG_H)
add_library(libavformat STATIC ${SRCS} ${HEADERS})
set_target_properties(libavformat PROPERTIES OUTPUT_NAME "avformat")