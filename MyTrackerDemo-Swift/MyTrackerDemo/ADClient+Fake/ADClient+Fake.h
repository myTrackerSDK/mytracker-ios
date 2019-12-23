//
//  ADClient+Fake.h
//  myTrackerSDK
//
//  Created by Andrey Seredkin on 18.08.17.
//  Copyright © 2017 MailRu Group. All rights reserved.
//

#import <iAd/iAd.h>

extern NSString *const kMRAttributionDetailsVersionKey;

extern NSString *const kMRAttributionDetailsAdgroupNameKey;
extern NSString *const kMRAttributionDetailsIadAttributionKey;
extern NSString *const kMRAttributionDetailsCampaignIdKey;
extern NSString *const kMRAttributionDetailsCampaignNameKey;
extern NSString *const kMRAttributionDetailsClickDateKey;
extern NSString *const kMRAttributionDetailsConversionDateKey;
extern NSString *const kMRAttributionDetailsAdgroupIdKey;
extern NSString *const kMRAttributionDetailsKeywordKey;

extern NSString *const kMRAttributionDetailsAdgroupNameValue;
extern BOOL const kMRAttributionDetailsAttributionValue;
extern NSInteger const kMRAttributionDetailsCampaignIdValue;
extern NSString *const kMRAttributionDetailsCampaignNameValue;
extern NSString *const kMRAttributionDetailsClickDateValue;
extern NSString *const kMRAttributionDetailsConversionDateValue;
extern NSInteger const kMRAttributionDetailsAdgroupIdValue;
extern NSString *const kMRAttributionDetailsKeywordValue;

@interface ADClient (Fake)

@property (nonatomic, assign) BOOL isAttributionDetailsEnabled;

@end
