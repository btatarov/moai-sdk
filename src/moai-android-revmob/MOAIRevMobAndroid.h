// Copyright (c) 2010-2011 Zipline Games, Inc. All Rights Reserved.
// http://getmoai.com

#ifndef	MOAIREVMOBANDROID_H
#define	MOAIREVMOBANDROID_H

#include <moai-core/headers.h>
#include <moai-android/JniUtils.h>

//================================================================//
// MOAIRevMobAndroid
//================================================================//
class MOAIRevMobAndroid :
	public MOAIGlobalClass < MOAIRevMobAndroid, MOAIGlobalEventSource >,
	public JniUtils {
private:

	jmethodID	mJava_CacheInterstitial;
	jmethodID	mJava_CacheRewardedVideo;
	jmethodID	mJava_HasCachedInterstitial;
	jmethodID	mJava_HasCachedRewardedVideo;
	jmethodID	mJava_Init;
	jmethodID	mJava_ShowInterstitial;
	jmethodID	mJava_ShowRewardedVideo;

	//----------------------------------------------------------------//
	static int	_cacheInterstitial		( lua_State* L );
	static int	_cacheRewardedVideo		( lua_State* L );
	static int	_hasCachedInterstitial	( lua_State* L );
	static int	_hasCachedRewardedVideo	( lua_State* L );
	static int	_init	 				( lua_State* L );
	static int	_showInterstitial 		( lua_State* L );
	static int	_showRewardedVideo 		( lua_State* L );

public:

	DECL_LUA_SINGLETON ( MOAIRevMobAndroid );

	enum {
		REWARDED_VIDEO_COMPLETED,
	};

	//----------------------------------------------------------------//
			MOAIRevMobAndroid	();
			~MOAIRevMobAndroid	();
	void	RegisterLuaClass	( MOAILuaState& state );
};


#endif  //MOAIREVMOBANDROID_H
