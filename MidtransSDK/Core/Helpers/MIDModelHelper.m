//
//  MIDModelHelper.m
//  MidtransSDK
//
//  Created by Nanang Rafsanjani on 10/11/18.
//  Copyright © 2018 Midtrans. All rights reserved.
//

#import "MIDModelHelper.h"

@implementation NSDictionary (extract)

- (id)objectOrNilForKey:(id)key {
    id object = [self objectForKey:key];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end

@implementation NSMutableDictionary (extract)

- (void)setIfNotNilValue:(id)value forKey:(NSString *)key {
    if (!value || [value isEqual:[NSNull null]]) {
        return;
    }
    [self setValue:value forKey:key];
}

@end

@implementation NSArray (parse)

- (NSArray *)dictionaryValues {
    NSMutableArray *result = [NSMutableArray new];
    for (id mappable in self) {
        if ([mappable respondsToSelector:@selector(dictionaryValue)]) {
            [result addObject:[mappable dictionaryValue]];
        }
    }
    return result;
}

- (NSArray *)mapToArray:(Class)type {
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *json in self) {
        [result addObject:[[type alloc] initWithDictionary:json]];
    }
    return result;
}

@end

@implementation NSString (helper)

+ (NSString *)nameOfBank:(MIDAcquiringBank)bank {
    switch (bank) {
        case MIDAcquiringBankBCA:
            return @"bca";
        case MIDAcquiringBankBNI:
            return @"bni";
        case MIDAcquiringBankBRI:
            return @"bri";
        case MIDAcquiringBankCIMB:
            return @"cimb";
        case MIDAcquiringBankMega:
            return @"mega";
        case MIDAcquiringBankDanamon:
            return @"danamon";
        case MIDAcquiringBankMandiri:
            return @"mandiri";
        case MIDAcquiringBankMaybank:
            return @"maybank";
        default:
            return nil;
    }
}

+ (NSString *)nameOfChannel:(MIDAcquiringChannel)channel {
    switch (channel) {
        case MIDAcquiringChannelMIGS:
            return @"migs";
        default:
            return nil;
    }
}

+ (NSString *)nameOfCreditCardTransactionType:(MIDCreditCardTransactionType)type {
    switch (type) {
        case MIDCreditCardTransactionTypeAuthorize:
            return @"authorize";
        case MIDCreditCardTransactionTypeAuthorizeCapture:
            return @"authorize_capture";
    }
}

+ (NSString *)typeOfPayment:(MIDGeneralPaymentType)payment {
    switch (payment) {
        case MIDGeneralPaymentTypeGoPay:
            return @"gopay";
        case MIDGeneralPaymentTypeKiosOn:
            return @"kioson";
        case MIDGeneralPaymentTypeAkulaku:
            return @"akulaku";
        case MIDGeneralPaymentTypeBRIEpay:
            return @"bri_epay";
        case MIDGeneralPaymentTypeIndomaret:
            return @"indomaret";
        case MIDGeneralPaymentTypeCIMBClicks:
            return @"cimb_clicks";
        case MIDGeneralPaymentTypeBCAKlikPay:
            return @"bca_klikpay";
        case MIDGeneralPaymentTypeMandiriEcash:
            return @"mandiri_ecash";
        case MIDGeneralPaymentTypeDanamonOnline:
            return @"danamon_online";
    }
}

+ (NSString *)typeOfVirtualAccount:(MIDVirtualAccountType)type {
    switch (type) {
        case MIDVirtualAccountTypeAll:
            return @"all_va";
        case MIDVirtualAccountTypeBCA:
            return @"bca_va";
        case MIDVirtualAccountTypeBNI:
            return @"bni_va";
        case MIDVirtualAccountTypeOther:
            return @"other_va";
        case MIDVirtualAccountTypePermata:
            return @"permata_va";
        case MIDVirtualAccountTypeEchannel:
            return @"echannel";
    }
}

+ (NSString *)nameOfExpiryUnit:(MIDExpiryTimeUnit)unit {
    switch (unit) {
        case MIDExpiryTimeUnitDay:
            return @"DAY";
        case MIDExpiryTimeUnitDays:
            return @"DAYS";
        case MIDExpiryTimeUnitHour:
            return @"HOUR";
        case MIDExpiryTimeUnitHours:
            return @"HOURS";
        case MIDExpiryTimeUnitMinute:
            return @"MINUTE";
        case MIDExpiryTimeUnitMinutes:
            return @"MINUTES";
    }
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    [df setDateFormat: format];
    return [df stringFromDate: date];
}

@end
