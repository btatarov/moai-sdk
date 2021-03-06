FRAMEWORKS = {

    AdColony = {
        MOAI_SDK_HOME .. '3rdparty-ios/adcolony-3.2.1/AdColony.framework'
    },

    AdMob = {
        MOAI_SDK_HOME .. '3rdparty-ios/admob-7.24.0/GoogleMobileAds.framework'
    },

    AppLovin = {
        MOAI_SDK_HOME .. '3rdparty-ios/applovin-4.3.1/AppLovinSDK.framework'
    },

    ChartBoost = {
        MOAI_SDK_HOME .. '3rdparty-ios/chartboost-7.0.1/Chartboost.framework'
    },

    Crittercism = {
        MOAI_SDK_HOME .. '3rdparty-ios/crittercism-5.6.8/Crittercism.framework'
    },

    Facebook = {
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.26.0/Bolts.framework',
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.26.0/FBSDKCoreKit.framework',
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.26.0/FBSDKLoginKit.framework',
        MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.26.0/FBSDKShareKit.framework',
    },

    RevMob = {
        MOAI_SDK_HOME .. '3rdparty-ios/revmob-10.0.0/RevMob.framework',
    },

    StartApp = {
        MOAI_SDK_HOME .. '3rdparty-ios/startapp-3.5.0/StartApp.bundle',
        MOAI_SDK_HOME .. '3rdparty-ios/startapp-3.5.0/StartApp.framework',
    },

    Vungle = {
        MOAI_SDK_HOME .. '3rdparty-ios/vungle-5.2.0/VungleSDK.framework',
    },
}

-- WARNING: these will always be copied to your host
-- change to EXTRA_MODULES = {} to avoid this
EXTRA_MODULES = {
    MOAI_SDK_HOME .. '3rdparty-ios/facebook-4.26.0/Bolts.framework',
    MOAI_SDK_HOME .. '3rdparty/fmod/lib/ios/libfmod_iphoneos.a',
    MOAI_SDK_HOME .. '3rdparty/fmod/lib/ios/libfmod_iphonesimulator.a',
}
