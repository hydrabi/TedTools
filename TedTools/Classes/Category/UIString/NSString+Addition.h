//
//  NSString+Addition.h
//  VideoTest
//
//  Created by iMac on 2018/9/18.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Addition)

//当前的时间戳 精确到毫秒
+(NSString *)currentTimeStamp;
+(NSString*)timeStampWithDate:(NSDate*)date;
-(CGSize)sizeWithFont:(UIFont*)font
             maxWidth:(NSInteger)maxWidth
            maxHeight:(NSInteger)maxHeight;

-(NSUInteger)cs_getBytesLength;

- (NSString *)cs_stringByDeletingPictureResolution;

/**
 判断自己是否为Null
 
 @return yes 为NULL
 */
-(BOOL)isNull;

#pragma mark - 时间相关

/**
 当前的时间戳 精确到毫秒
 
 @return 时间戳
 */
+(NSString *)currentTimeStamp;

/**
 指定日期的时间戳
 
 @param date 指定的日期
 @return 对应日期的时间戳
 */
+(NSString*)timeStampWithDate:(NSDate*)date;

/**
 修正时间戳长度，精确到毫秒
 
 @param timeStamp 时间戳
 @return 精确到毫秒之后的时间戳
 */
+(NSString*)fixTimeStamp:(NSString*)timeStamp;

/**
 当前为时间戳 返回对应的时间HH:mm
 
 @return 根据时间戳返回对应的时间
 */
-(NSString*)timeStampToHourAndMinute;

/**
 当前为时间戳 返回对应的时间MM:dd
 
 @return 根据时间戳返回对应的时间
 */
//-(NSString*)timeStampToMonthAndDay;

/**
 当前为时间戳 返回对应的时间
 
 @param formatString 根据指定格式
 @return 根据时间戳返回对应的时间
 */
-(NSString*)timeStampToFormatString:(NSString*)formatString;

/**
 会话列表时间 当天的显示为具体几点“17：25”；昨天显示为“昨天”；前天显示为“前天”；其他的显示为年月日（2018/5/24)
 
 @return  根据时间戳返回对应的会话列表时间
 */
//-(NSString*)conversionListUniversalTime;

/**
 根据格式返回指定的日期格式
 
 @param dataFormat 日期格式
 @return 格式返回置顶的日期格式
 */
+(NSString*)stringWithDateFormat:(NSString*)dataFormat;

/**
 返回时间指定格式-红包
 
 @param formateStr 时间格式
 @return 返回指定时间格式字符串
 */
- (NSString *)stringChangeFormateForRedPacketWithFormate:(NSString *)formateStr;
#pragma mark - 消息

/**
 创建消息唯一id 用户id+时间戳
 
 @param userId 用户id
 @return 创建消息唯一id
 */
+(NSString*)messageUniqueIDWithUserId:(NSString*)userId;

/**
 查找某个字符串的range数组
 
 @param string 要查找的字符串
 @return range数组
 */
- (NSArray *)rangeArrayOfString:(NSString *)string;

// 是否纯数字
- (BOOL)isAllDigital;
// 是否纯英文
- (BOOL)isAllEnglish;
// 是否数字&&英文
- (BOOL)isDigitalAndEnglish;
// 是否数字&&特殊字符（有且仅有）
- (BOOL)isDigitalAndSpecialCharacter;
// 是否数字+英文+特殊字符（有且仅有）
- (BOOL)isDigitalAndEnglishAndSpecialCharacter;
// 是否含数字
- (BOOL)hasDigital;
// 是否含英文
- (BOOL)hasEnglish;
// 是否含有特殊字符
- (BOOL)hasSpecialCharacter;

#pragma mark - 服务器语言

/**
 根据当前语言获取要发送到服务器的语言
 
 @param currentLanguage 当前语言
 @return 服务器语言
 */
+(NSString*)serverLanguageKeyWithCurrentLanguage:(NSString*)currentLanguage;

/**
 * 传入参数与url，拼接为一个带参数的url
 **/
+(NSString *)connectUrl:(NSMutableDictionary *)params url:(NSString *) urlLink;

#pragma mark - 单位转换
//μs ms s 单位转换
+(NSString*)transformedSecondValue:(NSNumber*)value;
//字节转换
+(NSString*)transformedByteValue:(NSNumber*)value;
@end
