#================================================================#
# Copyright (c) 2010-2011 Zipline Games, Inc.
# All Rights Reserved.
# http://getmoai.com
#================================================================#

	LOCAL_PATH := $(call my-dir)

	include $(CLEAR_VARS)
	include OptionalComponentsDefined.mk

	MOAI_SDK_HOME	:= ../../../
	MY_ARM_MODE		:= arm
	MY_ARM_ARCH		:= armeabi-v7a x86
	MOAI_MODULES	:= ../../../util/ant-libmoai/

	#----------------------------------------------------------------#
	# recursive wildcard function
	#----------------------------------------------------------------#

	rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2)$(filter $(subst *,%,$2),$d))

	LOCAL_MODULE 		:= moai
	LOCAL_ARM_MODE 		:= $(MY_ARM_MODE)
	LOCAL_LDLIBS 		:= -llog -lGLESv1_CM -lGLESv2 -lEGL
	LOCAL_CFLAGS		:=
	MY_LOCAL_CFLAGS		:=
	MY_INCLUDES			:=

#================================================================#
# core
#================================================================#

	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/src/zl-vfs
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/src/config-default

	#----------------------------------------------------------------#
	# ZL

	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/zl-core.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/zl-gfx.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/zl-vfs.mk

	#----------------------------------------------------------------#
	# ANDROID-APP

	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-android.mk

	#----------------------------------------------------------------#
	# MOAI

	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-core.mk

#================================================================#
# 3rd party (core)
#================================================================#

	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/contrib
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/expat-2.1.0/amiga
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/expat-2.1.0/lib
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/expat-2.1.0/xmlwf
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/jansson-2.1/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/libpvr-3.4
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/ooid-0.99
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/sfmt-1.4
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/sqlite-3.6.16
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/tinyxml
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/tlsf-2.0
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/zlib-1.2.3

	ifeq ($(MOAI_WITH_LUAJIT),true)
		MY_LOCAL_CFLAGS += -DMOAI_WITH_LUAJIT=1
		MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/LuaJIT-2.0.4/include
		MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-luajit.mk
	else
		MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/lua-5.1.3/src
		MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-lua.mk
	endif

	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-contrib.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-expat.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-json.mk

	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-pvr.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-sfmt.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-sqlite.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-tinyxml.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-zlib.mk

#================================================================#
# modules
#================================================================#

	#--------------------------------------------------------------#
	# REVMOB

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_REVMOB=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-revmob.mk

	#--------------------------------------------------------------#
	# ADCOLONY

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_ADCOLONY=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-adcolony.mk

	#--------------------------------------------------------------#
	# LUAEXT

	MY_LOCAL_CFLAGS += -DAKU_WITH_LUAEXT=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/luacrypto-0.2.0/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/luacurl-1.2.1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/luafilesystem-1.5.0/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/luasocket-2.0.2/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/luasocket-2.0.2-embed/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/luasql-2.2.0/src
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-luaext.mk

	#--------------------------------------------------------------#
	# TWITTER

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_TWITTER=0

	#--------------------------------------------------------------#
	# GOOGLE_PLAY_SERVICES

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_GOOGLE_PLAY_SERVICES=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-google-play-services.mk

	#--------------------------------------------------------------#
	# ADMOB

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_ADMOB=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-admob.mk

	#--------------------------------------------------------------#
	# HEYZAP

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_HEYZAP=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-heyzap.mk

	#--------------------------------------------------------------#
	# FMOD_STUDIO

	MY_LOCAL_CFLAGS += -DAKU_WITH_FMOD_STUDIO=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/src/moai-fmod-studio
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/fmod-1.08.00/headers
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-fmod.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-fmod-studio.mk

	#--------------------------------------------------------------#
	# GAMECIRCLE

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_GAMECIRCLE=0

	#--------------------------------------------------------------#
	# FACEBOOK

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_FACEBOOK=0

	#--------------------------------------------------------------#
	# SIM

	MY_LOCAL_CFLAGS += -DAKU_WITH_SIM=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/freetype-2.4.4/include
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/freetype-2.4.4/include/freetype
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/freetype-2.4.4/include/freetype2
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/freetype-2.4.4/builds
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/freetype-2.4.4/src
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/freetype-2.4.4/config
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/libtess2/Include
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/jpeg-8c
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/lpng1419
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-freetype.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-jpg.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-png.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-tess.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-sim.mk

	#--------------------------------------------------------------#
	# HTTP_CLIENT

	MY_LOCAL_CFLAGS += -DAKU_WITH_HTTP_CLIENT=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/c-ares-1.7.5
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/c-ares-1.7.5/include-android
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/curl-7.19.7/include-android
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/openssl-1.0.2g/include-android
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/openssl-1.0.2g/include
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-c-ares.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-curl.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-ssl.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-http-client.mk

	#--------------------------------------------------------------#
	# APPLOVIN

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_APPLOVIN=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-applovin.mk

	#--------------------------------------------------------------#
	# AMAZON_ADS

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_AMAZON_ADS=0

	#--------------------------------------------------------------#
	# BOX2D

	MY_LOCAL_CFLAGS += -DAKU_WITH_BOX2D=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D/Collision/Shapes
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D/Collision
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D/Common
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D/Dynamics
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D/Dynamics/Contacts
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/box2d-2.3.0/Box2D/Dynamics/Joints
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-box2d.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-box2d.mk

	#--------------------------------------------------------------#
	# CRYPTO

	MY_LOCAL_CFLAGS += -DAKU_WITH_CRYPTO=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/openssl-1.0.2g/include-android
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/openssl-1.0.2g/include
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/openssl-1.0.2g
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/openssl-1.0.2g/crypto
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-crypto.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/zl-crypto.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-crypto.mk

	#--------------------------------------------------------------#
	# VUNGLE

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_VUNGLE=0

	#--------------------------------------------------------------#
	# UNTZ

	MY_LOCAL_CFLAGS += -DAKU_WITH_UNTZ=0

	#--------------------------------------------------------------#
	# UTIL

	MY_LOCAL_CFLAGS += -DAKU_WITH_UTIL=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-util.mk

	#--------------------------------------------------------------#
	# OBB_DOWNLOADER

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_OBB_DOWNLOADER=0

	#--------------------------------------------------------------#
	# SPINE

	MY_LOCAL_CFLAGS += -DAKU_WITH_SPINE=1
	MY_HEADER_SEARCH_PATHS += $(MOAI_SDK_HOME)/3rdparty/spine-c/include
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/3rdparty-spine.mk
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-spine.mk

	#--------------------------------------------------------------#
	# CHARTBOOST

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_CHARTBOOST=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-chartboost.mk

	#--------------------------------------------------------------#
	# STARTAPP

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_STARTAPP=1
	MY_INCLUDES += $(MOAI_SDK_HOME)/ant/libmoai/modules/moai-startapp.mk

	#--------------------------------------------------------------#
	# CRITTERCISM

	MY_LOCAL_CFLAGS += -DAKU_WITH_ANDROID_CRITTERCISM=0


#================================================================#
# source files
#================================================================#

	LOCAL_CFLAGS		:= $(MY_LOCAL_CFLAGS) -DAKU_WITH_ANDROID=1 -DAKU_WITH_PLUGINS=1 -include $(MOAI_SDK_HOME)/src/zl-vfs/zl_replace.h
	LOCAL_C_INCLUDES 	:= $(MY_HEADER_SEARCH_PATHS)

	LOCAL_SRC_FILES 	+= src/jni.cpp
	LOCAL_SRC_FILES 	+= $(MOAI_SDK_HOME)/src/host-modules/aku_modules_android.cpp
	LOCAL_SRC_FILES 	+= $(MOAI_SDK_HOME)/src/host-modules/aku_modules_util.cpp
	LOCAL_SRC_FILES 	+= $(MOAI_SDK_HOME)/src/host-modules/aku_modules.cpp
	LOCAL_SRC_FILES 	+= src/aku_plugins.cpp

	LOCAL_SHARED_LIBRARIES := fmod
	LOCAL_STATIC_LIBRARIES := libmoai-adcolony libmoai-admob libmoai-applovin libmoai-chartboost libmoai-googleplayservices libmoai-heyzap libmoai-revmob libmoai-startapp libmoai-box2d libmoai-http-client libmoai-fmod-studio libmoai-luaext libmoai-sim libmoai-spine libmoai-crypto libmoai-util libmoai-core libzl-gfx libzl-crypto libzl-core libcontrib libbox2d libexpat libjson liblua libpvr libsfmt libspine libsqlite libtinyxml libfreetype libjpg libpng libtess libcurl libcares libssl libcrypto libzl-vfs libzlib
	LOCAL_WHOLE_STATIC_LIBRARIES := libmoai-android libmoai-sim libmoai-core libcrypto

#----------------------------------------------------------------#
# build shared library
#----------------------------------------------------------------#

	include $(BUILD_SHARED_LIBRARY)

#----------------------------------------------------------------#
# include submodules
#----------------------------------------------------------------#

	include $(MY_INCLUDES)
