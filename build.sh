#!/bin/sh
echo ">>> start ndk-build clean."
ndk-build clean NDK_PROJECT_PATH=`pwd` APP_BUILD_SCRIPT=`pwd`/Android.mk NDK_APPLICATION_MK=`pwd`/Application.mk
echo ">>> ndk-build clean finish."
echo ">>> start ndk-build."
ndk-build NDK_PROJECT_PATH=`pwd` APP_BUILD_SCRIPT=`pwd`/Android.mk NDK_APPLICATION_MK=`pwd`/Application.mk
echo ">>> ndk-build finish."