TARGET = psp-dod
PSPSDK = $(shell psp-config --pspsdk-path)
PSPBIN = $(shell psp-config --psp-prefix)/bin
SDL_CONFIG = $(PSPBIN)/sdl-config

SDLCFLAGS=-I/usr/local/pspdev/psp/include/SDL

OBJS = creature.o dod.o dodgame.o dungeon.o enhanced.o object.o oslink.o parser.o player.o sched.o viewer.o

DEFAULT_CFLAGS = $(shell $(SDL_CONFIG) --cflags | sed -re s/-Dmain=\\S+//)

MORE_CFLAGS = -g -O0 -Wall -G0 -DHAVE_OPENGL

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) $(SDLCFLAGS)

CXXFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -fno-exceptions -fno-rtti

LIBS =  -lSDL_mixer -lstdc++ -lGL -lpspvfpu -lvorbisidec -lpsppower -lSDL_image -lSDL -lpng -lz -lm -ljpeg
SDL_LIBS = $(shell $(SDL_CONFIG) --libs)

LIBS += $(shell echo $(SDL_LIBS) | sed -e s/-lSDLmain//)

EXTRA_TARGETS = EBOOT.PBP

BUILD_PRX=1
PSP_FW_VERSION=401

PSP_EBOOT_ICON = ICON0.PNG
PSP_EBOOT_PIC1 = PIC1.PNG

include $(PSPSDK)/lib/build.mak
