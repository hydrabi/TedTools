//
//  UIAlertController+Addition.h
//  VideoTest
//
//  Created by iMac on 2018/9/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Addition)
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
              defaultTitle:(NSString *)defaultTitle
               cancelTitle:(NSString *)cancelTitle
         completionHandler:(void (^)(BOOL result))completionHandler;

+ (void)showActionSheetWithTitle:(NSString *)title
                         options:(NSArray *)options
         selectOptionComplection:(void(^)(NSUInteger index, NSString *optionTitle))complection;
@end
