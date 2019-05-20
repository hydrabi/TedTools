//
//  NSUserDefaults+CSAddition.h
//  PayChat
//
//  Created by iMac on 2018/11/15.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (CSAddition)

+(void)set:(id)objcet key:(NSString*)key;

+(BOOL)getBoolValueWithKey:(NSString*)key;

+(NSInteger)getIntValueWithKey:(NSString*)key;

+(NSString*)getStringValueWithKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
