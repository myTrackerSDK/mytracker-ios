//
//  ViewController.m
//  myTrackerDemo
//
//  Created by Anton Bulankin on 26.07.16.
//  Copyright © 2016 Mail.ru Group. All rights reserved.
//

#import "ViewController.h"
#import <MyTrackerSDK/MyTrackerSDK.h>
#import "FakePurchase.h"

@interface ViewController ()

@end

@implementation ViewController
{
	IBOutlet UIButton *_trackLoginButton;
	IBOutlet UIButton *_trackInviteButton;
	IBOutlet UIButton *_trackRegistrationButton;
	IBOutlet UIButton *_trackPurchaseButton;
	IBOutlet UIButton *_trackLevelButton;
	IBOutlet UIButton *_trackCustomButton;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setStyleForButton:_trackLoginButton];
	[self setStyleForButton:_trackInviteButton];
	[self setStyleForButton:_trackRegistrationButton];
	[self setStyleForButton:_trackPurchaseButton];
	[self setStyleForButton:_trackLevelButton];
	[self setStyleForButton:_trackCustomButton];
}

- (void)setStyleForButton:(UIButton *)button
{
	button.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor;
	button.layer.borderWidth = 0.6;
	button.layer.cornerRadius = 4;
	button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.05];
}

- (IBAction)trackLogin:(id)sender
{
	[MRMyTracker trackLoginEvent];
}

- (IBAction)trackInvite:(id)sender
{
	[MRMyTracker trackInviteEvent];
}

- (IBAction)trackRegistration:(id)sender
{
	[MRMyTracker trackRegistrationEvent];
}

- (IBAction)trackPurchase:(id)sender
{
	SKProduct *product = [[FakeSKProduct alloc] init];
	SKPaymentTransaction *transaction = [[FakeSKTransaction alloc] init];
	[MRMyTracker trackPurchaseWithProduct:product transaction:transaction];
}

- (IBAction)trackLevel:(id)sender
{
	[MRMyTracker trackLevelAchievedWithLevel:@5];
}

- (IBAction)trackCustomEvent:(id)sender
{
	[MRMyTracker trackEventWithName:@"custom_event_name" eventParams:@{@"custom_param" : @"custom_value"}];
}

@end
