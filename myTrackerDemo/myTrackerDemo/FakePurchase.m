//
//  FakePurchase.m
//  myTrackerDemo
//
//  Created by Anton Bulankin on 26.07.16.
//  Copyright © 2016 Mail.ru Group. All rights reserved.
//

#import "FakePurchase.h"

@implementation FakeSKProduct

- (NSDecimalNumber *)price
{
	return [[NSDecimalNumber alloc] initWithString:@"100"];
}

- (NSLocale *)priceLocale
{
	return [[NSLocale alloc] initWithLocaleIdentifier:@"en_EN"];
}

- (NSString *)productIdentifier
{
	return @"fake_product_identifier";
}

@end

@interface FakeSKPayment : SKPayment

@end

@implementation FakeSKPayment

- (NSInteger)quantity
{
	return 5;
}

@end

@implementation FakeSKTransaction

- (NSData *)transactionReceipt
{
	return [@"fake_transaction_receipt_for_ios_6" dataUsingEncoding:NSUTF8StringEncoding];
}

- (SKPayment *)payment
{
	return [[FakeSKPayment alloc] init];
}

- (NSString *)transactionIdentifier
{
	return @"fake_transaction_identifier";
}

@end