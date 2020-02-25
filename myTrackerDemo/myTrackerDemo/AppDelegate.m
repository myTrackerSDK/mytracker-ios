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

// Current class implements MRMyTrackerAttributionDelegate protocol in order to be suitable for MRMyTracker attribution delegate property
@interface AppDelegate () <MRMyTrackerAttributionDelegate>

@end

@implementation AppDelegate
{
	NSString *_deeplink;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Enable debug mode for tracker
	[MRMyTracker setDebugMode:YES];
	
	// Get tracker's configuration object.
	MRMyTrackerConfig *config = [MRMyTracker trackerConfig];
	// Set trackLaunch property to YES.
	config.trackLaunch = YES;
	
	// Initialize tracker with trackerId.
	[MRMyTracker setupTracker:@"34380715224647855796"];
	
	// Get parameters instance
	MRMyTrackerParams *_params = [MRMyTracker trackerParams];
	// Set current user's age to 23 and gender option to unknown
	[_params setAge: @23];
	[_params setGender: MRGenderUnknown];
	// As you can see, trackerParams properties can be set any moment in any other place in the project
	
	// Set delegate which will receive attribution's information.
	[MRMyTracker setAttributionDelegate:self];
	
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

- (void)didReceiveAttribution:(MRMyTrackerAttribution *)attribution
{
	_deeplink = attribution.deeplink;
}

@end
