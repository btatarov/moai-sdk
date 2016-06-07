FRAMEWORKS = {

    AdColony = {
        MOAI_SDK_HOME .. '3rdparty-ios/adcolony-2.6.1/AdColony.framework'
    },

    AdMob = {
        MOAI_SDK_HOME .. '3rdparty-ios/admob-7.7.1/GoogleMobileAds.framework'
    },

    ChartBoost = {
        MOAI_SDK_HOME .. '3rdparty-ios/chartboost-6.4.2/Chartboost.framework'
    },

    Crittercism = {
        MOAI_SDK_HOME .. '3rdparty-ios/crittercism-5.5.1/Crittercism.framework'
    },

    Facebook = {
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.10.1/FBSDKCoreKit.framework',
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.10.1/FBSDKLoginKit.framework',
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.10.1/FBSDKShareKit.framework',
    },

    RevMob = {
        MOAI_SDK_HOME .. '3rdparty-ios/revmob-9.0.8/RevMobAds.framework',
    },

    StartApp = {
        MOAI_SDK_HOME .. '3rdparty-ios/startapp-3.3.2/StartApp.bundle',
        MOAI_SDK_HOME .. '3rdparty-ios/startapp-3.3.2/StartApp.framework',
    },

    Vungle = {
        MOAI_SDK_HOME .. '3rdparty-ios/vungle-3.2.0/VungleSDK.framework',
    },
}

-- WARNING: these will always be copied to your host
-- change to EXTRA_MODULES = {} to avoid this
EXTRA_MODULES = {

    MOAI_SDK_HOME .. '3rdparty/fmod/lib/ios/libfmod_iphoneos.a',
    MOAI_SDK_HOME .. '3rdparty/fmod/lib/ios/libfmod_iphonesimulator.a',
}