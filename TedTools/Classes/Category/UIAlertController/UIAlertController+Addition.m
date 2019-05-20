//
//  UIAlertController+Addition.m
//  VideoTest
//
//  Created by iMac on 2018/9/13.
//  Copyright © 2018年 iMac. All rights reserved.
//

#import "UIAlertController+Addition.h"

@implementation UIAlertController (Addition)

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
              defaultTitle:(NSString *)defaultTitle
               cancelTitle:(NSString *)cancelTitle
         completionHandler:(void (^)(BOOL result))completionHandler {
    
    if (!title) {
        title = @"";
    }
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (defaultTitle) {
        [alertC addAction:[UIAlertAction actionWithTitle:defaultTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (completionHandler) {
                completionHandler(YES);
            }
        }]];
    }
    if (cancelTitle) {
        [alertC addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (completionHandler) {
                completionHandler(NO);
            }
        }]];
    }
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }
    
    [vc presentViewController:alertC animated:YES completion:nil];
}

+ (void)showActionSheetWithTitle:(NSString *)title
                         options:(NSArray *)options
         selectOptionComplection:(void(^)(NSUInteger index, NSString *optionTitle))complection {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *option in options) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:option style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSUInteger index = [options indexOfObject:action.title];
            complection(index ,action.title);
        }];
        [alertC addAction:action];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertC addAction:cancelAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController showViewController:alertC sender:nil];
}

@end
