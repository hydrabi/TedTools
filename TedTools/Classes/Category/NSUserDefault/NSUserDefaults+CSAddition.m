//
//  NSUserDefaults+CSAddition.m
//  PayChat
//
//  Created by iMac on 2018/11/15.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "NSUserDefaults+CSAddition.h"

@implementation NSUserDefaults (CSAddition)

+(void)set:(id)objcet key:(NSString*)key{
    [[NSUserDefaults standardUserDefaults] setValue:objcet forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)getBoolValueWithKey:(NSString*)key{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:key] boolValue];
}

+(NSInteger)getIntValueWithKey:(NSString*)key{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:key] integerValue];
}

+(NSString*)getStringValueWithKey:(NSString*)key{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

@end
