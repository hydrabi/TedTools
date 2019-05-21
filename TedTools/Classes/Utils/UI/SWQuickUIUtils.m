//
//  CSQuickUIUtils.m
//  PayChat
//
//  Created by iMac on 2018/6/22.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "SWQuickUIUtils.h"
#import "SWCachePathManager.h"
#import "NSString+Addition.h"
@implementation SWQuickUIUtils

+ (UIImage *)imageWithFilePath:(NSString *)filePath
{
    if ([filePath isNull]) {
        return nil;
    }
    
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (UIImage *)imageWithFileName:(NSString *)fileName conversationId:(NSString*)conversationId
{
    if ([fileName isNull]) {
        return nil;
    }
    
    NSString *filePath = [[SWCachePathManager shareInstance] imageCacheFilePathWithConversationId:conversationId fileName:fileName];
    
    return [UIImage imageWithContentsOfFile:filePath];
}

@end
