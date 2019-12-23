//
//  AppDelegate.swift
//  MyTrackerDemo
//
//  Created by Alexander Zakatnov on 11.11.2019.
//  Copyright © 2019 Alexander Zakatnov. All rights reserved.
//
	
import UIKit
import MyTrackerSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	
	var window: UIWindow?
	
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		// Enable debug mode for tracker
		MRMyTracker.setDebugMode(true)
		
		// Get tracker's configuration object.
		let trackerConfig = MRMyTracker.trackerConfig()
		// Set trackLaunch property to true.
		trackerConfig.trackLaunch = true
		
		// Initialize tracker with trackerId.
		MRMyTracker.setupTracker("34380715224647855796")
		
		// Set current user's age to 23
		MRMyTracker.trackerParams().age = NSNumber(value: 23)
		// As you can see, trackerParams properties can be set any moment in any other place in the project
		
		ADClient.shared().isAttributionDetailsEnabled = false;
		
		return true
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool
	{
		return MRMyTracker.handleOpen(url, options: options)
	}

	func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
	{
		return MRMyTracker.handleOpen(url, sourceApplication: sourceApplication, annotation: annotation)
	}

	func application(_ application: UIApplication,
					 continue userActivity: NSUserActivity,
					 restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
	{
		guard let handler: ([Any]?) -> Void = restorationHandler as? ([Any]?) -> ()
		else
		{
			return false
		}
		return MRMyTracker.continue(userActivity, restorationHandler: handler)
	}
}
