#!/bin/sh
BIN=$(readlink -f -- $(dirname -- "$0"))
cd $BIN/../LuaJIT-2.0.4
make PREFIX=/home/ops/luajit
make install PREFIX=/home/ops/luajit
cd $BIN/../openssl-1.0.0i/
./config
cd $BIN
export LUAJIT_LIB=/home/ops/luajit/lib
export LUAJIT_INC=/home/ops/luajit/include/luajit-2.0
/usr/sbin/groupadd -f www
/usr/sbin/useradd -g www www
    ./configure --prefix=/home/ops/nginx \
         --with-pcre=../pcre-8.37 \
         --with-pcre-jit \
         --with-ld-opt=-Wl,-rpath,/home/ops/luajit/lib \
         --with-http_stub_status_module \
         --with-http_sub_module \
         --with-http_ssl_module \
         --with-http_realip_module \
         --with-http_spdy_module \
         --add-module=../echo-nginx-module-0.58 \
         --add-module=../lua-nginx-module-0.9.16 \
         --add-module=../ngx-limit-req2 \
         --with-openssl=../openssl-1.0.0p \
         --with-openssl-opt="enable-tlsext" \
         --user=www --group=www

