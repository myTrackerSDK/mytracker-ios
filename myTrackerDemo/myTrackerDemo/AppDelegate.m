//
//  AppDelegate.m
//  myTrackerDemo
//
//  Created by Anton Bulankin on 26.07.16.
//  Copyright © 2016 Mail.ru Group. All rights reserved.
//

#import "AppDelegate.h"
#import <MyTrackerSDK/MyTrackerSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	[MRMyTracker setDebugMode:YES];
	[MRMyTracker createTracker:@"97953241358447035268"];
	MRMyTrackerParams *_params = [MRMyTracker trackerParams];
	[_params setAge: @100];
	[_params setGender: MRGenderUnknown];
	[_params setVkIds:@[@"someID"]];
	[_params setEmails:@[@"a@a.ru"]];
	[_params setIcqIds:@[@"someUIN"]];
	[_params setOkIds:@[@"someID"]];
	[_params setMrgsUserId:@"someID"];
	[_params setCustomUserIds:@[@"someID"]];
	[MRMyTracker setupTracker];

	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
