//
//  SWImage.h
//  PayChat
//
//  Created by huangchusheng on 2018/5/23.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kImageMaxLength (512 * 1024) // 图片最大byte

// 图片
UIImage *SWImageWithName(NSString *imageName);
// 图片
UIImage *SWImageWithNameFromBundle(NSString *imageName, NSString *bundleName);
// 通过颜色转化图片
UIImage *SWImageFromColor(UIColor *color);
// 通过颜色转化图片，指定size
UIImage *SWImageFromColorWithSize(UIColor *color, CGSize size);
// 通过颜色转化一定大小的圆形图片
UIImage *SWEllipseImageFromColorWithSize(UIColor *color, CGSize size);
// 头像占位图
UIImage *SWAvatarPlaceholderImage(void);
// 群头像占位图
UIImage *SWGroupAvatarPlaceholderImage(void);
// 头像占位图（深灰 60*60）
UIImage *SWAvatarPlaceholder_gray60(void);
// 头像占位图（深灰 42*42）
UIImage *SWAvatarPlaceholder_gray42(void);
// 返回按钮图
UIImage *SWBackImage(void);

/**
 生成二维码
 
 @param url 要生成二维码的url
 @param size 图片尺寸
 @return 二维码UIImage
 */
UIImage *SWQRCodeImageForUrl(NSString *url, CGSize size);

/**
 获取默认渐变图
 
 @param size 尺寸
 @return 回调
 */
UIImage *SWDefaultGradientImageWithSize(CGSize size);

