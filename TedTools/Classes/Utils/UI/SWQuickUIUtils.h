//
//  CSQuickUIUtils.h
//  PayChat
//
//  Created by iMac on 2018/6/22.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SWQuickUIUtils : NSObject
+ (UIImage *)imageWithFilePath:(NSString *)filePath;
+ (UIImage *)imageWithFileName:(NSString *)fileName conversationId:(NSString*)conversationId;
@end
