#!/bin/bash

PREFIX=./myAndroid
NDK=$ANDROID_NDK
PLATFORM=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
PREBUILD=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
./configure --target-os=linux \
    --enable-cross-compile \
    --prefix=$PREFIX  \
    --disable-yasm \
    --arch=arm \
    --enable-version3 \
    --enable-gpl \
    --enable-shared \
    --disable-bzlib \
    --disable-sse \
    --disable-libfaac \
    --disable-muxers \
    --disable-bsfs \
    --disable-avdevice \
    --disable-devices \
    --disable-encoders \
    --enable-protocols \
    --enable-demuxers \
    --enable-parsers \
    --enable-decoders \
    --disable-static \
    --disable-symver\
    --cc=$PREBUILD/bin/aarch64-linux-android-gcc \
    --cross-prefix=$PREBUILD/bin/aarch64-linux-android- \
    --nm=$PREBUILD/bin/aarch64-linux-android-nm \
    --extra-cflags=" -fPIC -DANDROID -I../libx264/x264-0.120.2151+gita3f4407/myAndroid/include" \
    --disable-asm \
    --extra-ldflags="-Wl,-rpath-link=$PLATFORM/lib -Wl,-rpath-link=. -L $PLATFORM/lib -L . -nostdlib"

make    
#make -j4  

#支持x264 的 编译

#--enable-encoder=h263 \
#--enable-encoder=h264 \
#--enable-encoder=libx264 \
#--enable-muxer=mp4 \
#--enable-libx264 \

#$PREBUILD/bin/arm-linux-androideabi-ld -rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib  -soname libffmpeg.so -shared -nostdlib  -z,noexecstack -Bsymbolic --whole-archive --no-undefined -o $PREFIX/libffmpeg.so libavcodec/libavcodec.a libavformat/libavformat.a libavutil/libavutil.a  -lc -lm -lz -ldl -llog  --warn-once  --dynamic-linker=/system/bin/linker $PREBUILD/lib/gcc/arm-eabi/4.4.0/libgcc.a


#$PREBUILD/bin/arm-linux-androideabi-ar d libavcodec/libavcodec.a inverse.o
#
#$PREBUILD/bin/arm-linux-androideabi-ld -rpath-link=$PLATFORM/sysroot/usr/lib -L$PLATFORM/sysroot/usr/lib  -soname libffmpeg.so -shared -nostdlib  -z,noexecstack -Bsymbolic --whole-archive --no-undefined -o $PREFIX/libffmpeg.so libavcodec/libavcodec.a libavformat/libavformat.a libavutil/libavutil.a  -lc -lm -lz -ldl -llog  --warn-once  --dynamic-linker=/system/bin/linker $PREBUILD/lib/gcc/arm-linux-androideabi/4.4.3/libgcc.a
