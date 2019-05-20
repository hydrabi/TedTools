//
//  NSString+Addition.m
//  VideoTest
//
//  Created by iMac on 2018/9/18.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

//当前的时间戳 精确到毫秒
+(NSString *)currentTimeStamp{
    long long _millisecond = [[NSDate date] timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%llu",_millisecond];
}

+(NSString*)timeStampWithDate:(NSDate*)date{
    long long _millisecond = [date timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%llu",_millisecond];
}

-(CGSize) sizeWithFont:(UIFont*) font maxWidth:(NSInteger) maxWidth maxHeight:(NSInteger) maxHeight{

    CGSize wordSize = [self boundingRectWithSize:CGSizeMake(99999, maxHeight) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;

    if(wordSize.width > maxWidth)
    {
        wordSize=[self boundingRectWithSize:CGSizeMake(maxWidth, 99999) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
        
        return CGSizeMake(maxWidth, roundf(wordSize.height + 1));
    }

    return CGSizeMake(wordSize.width, wordSize.height);
}

- (NSDateFormatter*)defaultNSDateFormatter
{
    static dispatch_once_t pred = 0;
    static NSDateFormatter *formatter = nil;
    dispatch_once(&pred, ^{
        formatter = [[NSDateFormatter alloc] init];
    });
    return formatter;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    
    if (maxSize.width != 0 || maxSize.height != 0)
    {
        NSDictionary *attrs = @{NSFontAttributeName : font};
        return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    else
    {
        return CGSizeZero;
    }
}

//编码之后的长度
-(NSUInteger)cs_getBytesLength{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [self lengthOfBytesUsingEncoding:enc];
}

- (NSString *)cs_stringByDeletingPictureResolution{
    NSString *doubleResolution  = @"@2x";
    NSString *tribleResolution = @"@3x";
    NSString *fileName = self.stringByDeletingPathExtension;
    NSString *res = [self copy];
    if ([fileName hasSuffix:doubleResolution] || [fileName hasSuffix:tribleResolution]) {
        res = [fileName substringToIndex:fileName.length - 3];
        if (self.pathExtension.length) {
            res = [res stringByAppendingPathExtension:self.pathExtension];
        }
    }
    return res;
}

-(BOOL)isNull{
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (!self || [self isKindOfClass:[NSNull class]] || self.length == 0 || [self isEqualToString:@""]) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - 时间相关
//是否前天
//-(BOOL)isTheDataBeforeYesterday{
//    NSTimeInterval interval = [self longLongValue] / 1000;
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
//
//    NSCalendar *cal = [NSCalendar currentCalendar];
//    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[[NSDate date] dateBySubtractingDays:1]];
//    NSDate *tomorrow = [cal dateFromComponents:components];
//    components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
//    NSDate *otherDate = [cal dateFromComponents:components];
//
//    return [tomorrow isEqualToDate:otherDate];
//}

+(NSString*)fixTimeStamp:(NSString*)timeStamp{
    NSString *result = [[NSString alloc] initWithString:timeStamp];
    if(timeStamp.length == 10){
        result = [NSString stringWithFormat:@"%@",@(timeStamp.integerValue * 1000).stringValue];
        //         result = [NSString stringWithFormat:@"%@",@(timeStamp.intValue * 1000).stringValue];
    }
    return result;
}

//当前为时间戳 返回对应的时间
-(NSString*)timeStampToHourAndMinute{
    NSTimeInterval interval = [self longLongValue] / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [self defaultNSDateFormatter];
    formatter.dateFormat = @"HH:mm";
    return [formatter stringFromDate:date];
}

//当前为时间戳 返回对应的时间
//-(NSString*)timeStampToMonthAndDay{
//    NSTimeInterval interval = [self longLongValue] / 1000;
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
//
//    return [CSLocalDateFormatter dateStringFromDate:date withFormatTemplate:@"dMMM"];
//}

-(NSString*)timeStampToFormatString:(NSString*)formatString{
    NSTimeInterval interval = [self longLongValue] / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [self defaultNSDateFormatter];
    formatter.dateFormat = formatString;
    return [formatter stringFromDate:date];
}

//会话列表时间 当天的显示为具体几点“17：25”；昨天显示为“昨天”；前天显示为“前天”；其他的显示为年月日（2018/5/24)
//-(NSString*)conversionListUniversalTime{
//    NSTimeInterval interval = [self longLongValue] / 1000;
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
//
//    NSDateFormatter *formatter = [self defaultNSDateFormatter];
//
//    //前天
//    if([self isTheDataBeforeYesterday]){
//        return CSLocalized(@"ConversationList.Time.TheDayBeforeYesterday");
//    }
//    //昨天
//    else if(date.isYesterday){
//        return CSLocalized(@"ConversationList.Time.Yesterday");
//    }
//    //今天
//    else if(date.isToday){
//        formatter.dateFormat = @"HH:mm";
//        return [formatter stringFromDate:date];
//    }
//    //其它
//    else{
//        formatter.dateFormat = @"yyyy/MM/dd";
//        return [formatter stringFromDate:date];
//    }
//}

+(NSString*)stringWithDateFormat:(NSString*)dataFormat{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];;
    return [formatter stringFromDate:date];
}

- (NSString *)stringChangeFormateForRedPacketWithFormate:(NSString *)formateStr {
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormate dateFromString:self];
    NSDateFormatter *newDateFormate = [[NSDateFormatter alloc] init];
    [newDateFormate setDateFormat:formateStr];
    NSString *timeStr = [newDateFormate stringFromDate:date];
    return timeStr;
}

#pragma mark - 消息
+(NSString*)messageUniqueIDWithUserId:(NSString*)userId{
    return [NSString stringWithFormat:@"%@%@",userId?userId:@"",[NSString currentTimeStamp]];
}


/**
 查找某个字符串的range数组
 
 @param string 要查找的字符串
 @return range数组
 */
- (NSArray *)rangeArrayOfString:(NSString *)string {
    NSMutableArray *rangeArray = [NSMutableArray new];
    NSRange searchInRange = NSMakeRange(0, self.length);
    while (1) {
        // 从后往前查找
        NSRange range = [self rangeOfString:string options:NSBackwardsSearch|NSCaseInsensitiveSearch range:searchInRange];
        if (range.location != NSNotFound) {
            // 如果存在，则将重设查找的长度
            searchInRange.length = range.location;
            [rangeArray addObject:[NSValue valueWithRange:range]];
        } else {
            break;
        }
    }
    return rangeArray;
}
+ (NSString *)specialCharacters {
    return @"-/:;()$&@.,?!\\[\\]{}#%%^*+=_|~<>";
}
// 是否纯数字
- (BOOL)isAllDigital {
    NSString *regex =@"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}
// 是否纯英文
- (BOOL)isAllEnglish {
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
// 是否数字&&英文（有且仅有）
- (BOOL)isDigitalAndEnglish {
    NSString *regex = @"^(?=.*[a-zA-Z]+)(?=.*[0-9]+)[a-zA-Z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
// 是否数字&&特殊字符（有且仅有）
- (BOOL)isDigitalAndSpecialCharacter {
    NSString *specialCharacters = [NSString specialCharacters];  // 匹配的特殊字符
    NSString *regex = [NSString stringWithFormat:@"^(?=.*[0-9]+)(?=.*[%@]+)[0-9%@]+$",specialCharacters,specialCharacters];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
// 是否数字+英文+特殊字符（有且仅有）
- (BOOL)isDigitalAndEnglishAndSpecialCharacter {
    NSString *specialCharacters = [NSString specialCharacters];  // 匹配的特殊字符
    NSString *regex = [NSString stringWithFormat:@"^(?=.*[a-zA-Z]+)(?=.*[0-9]+)(?=.*[%@]+)[a-zA-Z0-9%@]+$",specialCharacters,specialCharacters];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
// 是否含数字
- (BOOL)hasDigital {
    NSString *regex =@".*[0-9]+.*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}
// 是否含英文
- (BOOL)hasEnglish {
    NSString *regex = @".*[A-Za-z]+.*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
// 是否含有特殊字符
- (BOOL)hasSpecialCharacter {
    NSString *specialCharacters = [NSString specialCharacters];  // 匹配的特殊字符
    NSString *regex = [NSString stringWithFormat:@".*[%@]+.*",specialCharacters];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

#pragma mark - 服务器语言
+(NSString*)serverLanguageKeyWithCurrentLanguage:(NSString*)currentLanguage{
    NSDictionary *dic = @{@"zh-Hans":@"zh",
                          @"en":@"en"};
    NSString *result = dic[currentLanguage];
    if(result.length > 0){
        return result;
    }
    return @"en";
}

#pragma mark - 拼接url
/**
 * 传入参数与url，拼接为一个带参数的url
 **/
+(NSString *)connectUrl:(NSMutableDictionary *)params url:(NSString *) urlLink{
    // 初始化参数变量
    NSString *str = @"";
    
    // 快速遍历参数数组
    for(id key in params) {
        NSLog(@"key :%@  value :%@", key, [params objectForKey:key]);
        str = [str stringByAppendingString:key];
        str = [str stringByAppendingString:@"＝"];
        str = [str stringByAppendingString:[params objectForKey:key]];
        str = [str stringByAppendingString:@"&"];
    }
    // 处理多余的&以及返回含参url
    if (str.length > 1) {
        // 去掉末尾的&
        str = [str substringToIndex:str.length - 1];
        // 返回含参url
        return [urlLink stringByAppendingString:str];
    }
    return Nil;
}

#pragma mark - 单位转换

//μs ms s 单位转换
+(NSString*)transformedSecondValue:(NSNumber*)value
{
    double convertedValue = [value doubleValue];
    int multiplyFactor = 0;
    
    NSArray *tokens = [NSArray arrayWithObjects:@"μs",@"ms",@"s",@"min",@"h",nil];
    
    while (convertedValue > 1000) {
        convertedValue /= 1000;
        multiplyFactor++;
        if(multiplyFactor == 2){
            break;
        }
    }
    
    while (convertedValue > 60) {
        convertedValue /= 60;
        multiplyFactor++;
        if(multiplyFactor == (tokens.count - 1)){
            break;
        }
    }
    
    return [NSString stringWithFormat:@"%.2f %@",convertedValue, [tokens objectAtIndex:multiplyFactor]];
}

//字节转换
+(NSString*)transformedByteValue:(NSNumber*)value
{
    
    double convertedValue = [value doubleValue];
    int multiplyFactor = 0;
    
    NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB", @"ZB", @"YB",nil];
    
    while (convertedValue > 1024) {
        convertedValue /= 1024;
        multiplyFactor++;
    }
    
    return [NSString stringWithFormat:@"%.2f %@",convertedValue, [tokens objectAtIndex:multiplyFactor]];
}

@end
