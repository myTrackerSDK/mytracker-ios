//
//  ADClient+Fake.m
//  myTrackerSDK
//
//  Created by Andrey Seredkin on 18.08.17.
//  Copyright © 2017 MailRu Group. All rights reserved.
//

#import <objc/runtime.h>
#import "ADClient+Fake.h"

NSString *const kMRAttributionDetailsVersionKey = @"Version3.1";

NSString *const kMRAttributionDetailsAdgroupNameKey = @"iad-adgroup-name";
NSString *const kMRAttributionDetailsIadAttributionKey = @"iad-attribution";
NSString *const kMRAttributionDetailsCampaignIdKey = @"iad-campaign-id";
NSString *const kMRAttributionDetailsCampaignNameKey = @"iad-campaign-name";
NSString *const kMRAttributionDetailsClickDateKey = @"iad-click-date";
NSString *const kMRAttributionDetailsConversionDateKey = @"iad-conversion-date";
NSString *const kMRAttributionDetailsAdgroupIdKey = @"iad-adgroup-id";
NSString *const kMRAttributionDetailsKeywordKey = @"iad-keyword";

NSString *const kMRAttributionDetailsAdgroupNameValue = @"AdGroupName";
BOOL const kMRAttributionDetailsAttributionValue = YES;
NSInteger const kMRAttributionDetailsCampaignIdValue = 1234567890;
NSString *const kMRAttributionDetailsCampaignNameValue = @"CampaignName";
NSString *const kMRAttributionDetailsClickDateValue = @"2016-06-28T23:54:54Z";
NSString *const kMRAttributionDetailsConversionDateValue = @"2016-06-28T23:54:54Z";
NSInteger const kMRAttributionDetailsAdgroupIdValue = 1234567890;
NSString *const kMRAttributionDetailsKeywordValue = @"Keyword";

static char const * const AttributionDetailsKey = "AttributionDetails";

@implementation ADClient (Fake)

- (void)setIsAttributionDetailsEnabled:(BOOL)isAttributionDetailsEnabled
{
	NSNumber *number = [NSNumber numberWithBool: isAttributionDetailsEnabled];
	objc_setAssociatedObject(self, AttributionDetailsKey, number , OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isAttributionDetailsEnabled
{
	NSNumber *number = objc_getAssociatedObject(self, AttributionDetailsKey);
	return [number boolValue];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)requestAttributionDetailsWithBlock:(void (^)(NSDictionary *attributionDetails, NSError *error))completionHandler
{
	if (!self.isAttributionDetailsEnabled)
	{
		completionHandler(nil, [NSError errorWithDomain:NSPOSIXErrorDomain code:500 userInfo:@{NSLocalizedDescriptionKey: @"Attribution details disabled"}]);
	}
	else
	{
		completionHandler(@{
						kMRAttributionDetailsVersionKey: @{
								kMRAttributionDetailsAdgroupNameKey: kMRAttributionDetailsAdgroupNameValue,
								kMRAttributionDetailsIadAttributionKey: @(kMRAttributionDetailsAttributionValue),
								kMRAttributionDetailsCampaignIdKey: @(kMRAttributionDetailsCampaignIdValue),
								kMRAttributionDetailsCampaignNameKey: kMRAttributionDetailsCampaignNameValue,
								kMRAttributionDetailsClickDateKey: kMRAttributionDetailsClickDateValue,
								kMRAttributionDetailsConversionDateKey: kMRAttributionDetailsConversionDateValue,
								kMRAttributionDetailsAdgroupIdKey: @(kMRAttributionDetailsAdgroupIdValue),
								kMRAttributionDetailsKeywordKey: kMRAttributionDetailsKeywordValue
								}
						}, nil);
	}
}

#pragma clang diagnostic pop

@end
