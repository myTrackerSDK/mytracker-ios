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
	
	private var deeplink: String?
	
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		// Enable debug mode for tracker
		MRMyTracker.setDebugMode(enabled: true)
		
		// Get tracker's configuration object.
		let trackerConfig = MRMyTracker.trackerConfig()
		// Set trackLaunch property to true.
		trackerConfig.trackLaunch = true
		
		// Initialize tracker with trackerId.
		MRMyTracker.setupTracker("51464618419148920898")
		
		// Set current user's age to 23
		MRMyTracker.trackerParams().age = NSNumber(value: 23)
		
		
		// Set delegate which will receive attribution's information.
		MRMyTracker.setAttribution(delegate: self)
		
		return true
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool
	{
		return MRMyTracker.handleOpen(url: url, options: nil)
	}

	func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
	{
		return MRMyTracker.handleOpen(url: url, sourceApplication: nil, annotation: nil)
	}

	func application(_ application: UIApplication,
					 continue userActivity: NSUserActivity,
					 restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
	{
		return MRMyTracker.continue(userActivity: userActivity, restorationHandler: nil)
	}
}

// Current class implements MRMyTrackerAttributionDelegate protocol in order to be suitable for MRMyTracker attribution delegate property
extension AppDelegate: MRMyTrackerAttributionDelegate
{
	func didReceive(attribution: MRMyTrackerAttribution)
	{
		deeplink = attribution.deeplink
	}
}
