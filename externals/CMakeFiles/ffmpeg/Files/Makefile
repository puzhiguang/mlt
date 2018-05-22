include ../../../ffmpeg/ffbuild/config.mak
include ../../../ffmpeg/$(target)/Makefile

print:
	@echo "set($(target)_SRCS $(OBJS:.o=.c) $(OBJS-yes:.o=.c))" > $(target).cmake
