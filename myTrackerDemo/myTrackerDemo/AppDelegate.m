//
//  AppDelegate.m
//  myTrackerDemo
//
//  Created by Anton Bulankin on 26.07.16.
//  Copyright © 2016 Mail.ru Group. All rights reserved.
//

#import "AppDelegate.h"
#import <MyTrackerSDK/MyTrackerSDK.h>
#import "ADClient+Fake.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[MRMyTracker setDebugMode:YES];
	MRMyTrackerParams *_params = [MRMyTracker trackerParams];
	[_params setAge: @100];
	[_params setGender: MRGenderUnknown];
	[MRMyTracker setupTracker:@"34380715224647855796"];
	[ADClient sharedClient].isAttributionDetailsEnabled = NO;
	return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
	return [MRMyTracker handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
	return [MRMyTracker handleOpenURL:url options:options];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler
{
	return [MRMyTracker continueUserActivity:userActivity restorationHandler:restorationHandler];
}

@end
