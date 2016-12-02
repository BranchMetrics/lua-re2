.PHONY: all install clean

CC ?= gcc
LIBFLAG ?= -shared
CFLAGS ?= -g -O3 -g -Wall -MMD
LUA_VERSION =       5.1
PREFIX =            /usr/local
LIBDIR = $(PREFIX)/lib
#LUA_CMODULE_DIR =   $(PREFIX)/lib/lua/$(LUA_VERSION)
LUA_CMODULE_DIR = /opt/openresty/lualib
#LUA_MODULE_DIR =    $(PREFIX)/share/lua/$(LUA_VERSION)
LUA_MODULE_DIR = /opt/openresty/lualib

libre2c.so: re2_c.cxx
	$(CC) $(CFLAGS) -fPIC -std=c++11 -shared -o $@ $< $(LIBDIR)/libre2.so

all: libre2c.so

install: libre2c.so lua-re2.lua
	mkdir -p $(LUA_CMODULE_DIR) $(LUA_MODULE_DIR)
	install -c libre2c.so $(LUA_CMODULE_DIR)
	install -c lua-re2.lua $(LUA_MODULE_DIR)

clean:
	rm libre2c*

