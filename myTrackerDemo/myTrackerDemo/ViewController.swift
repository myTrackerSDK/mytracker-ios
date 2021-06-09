//
//  ViewController.swift
//  MyTrackerDemo
//
//  Created by Alexander Zakatnov on 11.11.2019.
//  Copyright © 2019 Alexander Zakatnov. All rights reserved.
//

import UIKit
import MyTrackerSDK

class ViewController: UIViewController
{
	@IBOutlet weak var customEventNameField: UITextField!

	@IBAction func trackCustomEvent(_ sender: Any)
	{
		guard let eventName = customEventNameField.text
		else
		{
			return
		}
		// Track custom event if eventName is not nil
		MRMyTracker.trackEvent(withName: eventName)
	}

	@IBAction func trackLoginEvent(_ sender: Any)
	{
		MRMyTracker.trackLoginEvent("custom_user_identifier",
									withVkConnectId:"vk_connect_id")
	}

	@IBAction func trackRegistrationEvent(_ sender: Any)
	{
		MRMyTracker.trackRegistrationEvent("custom_user_identifier",
										   withVkConnectId:"vk_connect_id")
	}

	@IBAction func trackInviteEvent(_ sender: Any)
	{
		MRMyTracker.trackInviteEvent()
	}

	@IBAction func trackLevelAchievedEvent(_ sender: Any)
	{
		MRMyTracker.trackLevelAchieved()
	}

	override func viewDidLoad()
	{
		super.viewDidLoad()

		for v in view.subviews
		{
			if let btn = v as? UIButton
			{
				stylizeButton(btn: btn)
			}
		}
	}

	private func stylizeButton(btn: UIButton)
	{
		btn.backgroundColor = UIColor.red.withAlphaComponent(0.5)
		btn.clipsToBounds = true
		btn.layer.borderColor = UIColor.red.withAlphaComponent(0.9).cgColor
		btn.layer.borderWidth = 1.0
		btn.layer.cornerRadius = 5.0
		btn.setTitleColor(UIColor.white, for: .normal)
	}
}

