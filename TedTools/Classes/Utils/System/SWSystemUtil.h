//
//  CSSystemUtil.h
//  PayChat
//
//  Created by iMac on 2018/6/23.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWSystemUtil : NSObject
+ (BOOL)cameraAvailable;
+ (BOOL)frontCameraAvailable;
+ (BOOL)cameraFlashAvailable;
+ (BOOL)canSendSMS;
+ (BOOL)canMakePhoneCall;
+ (BOOL)isAppCameraAccessAuthorized;

@end
