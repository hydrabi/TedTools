//
//  Macro.h
//  Original
//
//  Created by Hydra on 2018/9/24.
//  Copyright © 2018年 毕志锋. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define kAppdelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define MAS_SHORTHAND_GLOBALS

//导航栏颜色
#define NAVBAR_COLOR RGB(196,40,44)

#ifdef DEBUG
#define NSLog(format,...) NSLog((@"%s [Line %d] " format),__func__,__LINE__,##__VA_ARGS__);
#else
#define NSLog(format,...)
#endif

//-------------------获取设备大小-------------------------
// iPhone X判断
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// iPhone XR判断
#define IS_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// iPhone Xs Max判断
#define IS_iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? 34.f : 0.f)

// 导航栏、tabbar写死高度
#define NAVBAR_HEIGHT (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? 88.f : 64.f)
#define TABBAR_HEIGHT (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? (49.f+34.f) : 49.f)
#define SAFE_AREA_BOTTOM (IS_iPhoneX || IS_iPhoneXR || IS_iPhoneXsMax ? 34.f : 0.F)

//获取屏幕 宽度、高度
#define Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height ([UIScreen mainScreen].bounds.size.height)

#endif /* Macro_h */
