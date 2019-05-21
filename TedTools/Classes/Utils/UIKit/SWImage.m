//
//  SWImage.m
//  PayChat
//
//  Created by huangchusheng on 2018/5/23.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "SWImage.h"

// 图片
UIImage *SWImageWithName(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

// 图片
UIImage *SWImageWithNameFromBundle(NSString *imageName, NSString *bundleName) {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"]];
    return [UIImage imageWithContentsOfFile:[bundle.bundlePath stringByAppendingPathComponent:imageName]];
}
// 通过颜色转化图片
UIImage *SWImageFromColor(UIColor *color) {
    UIImage *image = SWImageFromColorWithSize(color, CGSizeMake(1, 1));
    return image;
}
// 通过颜色转化图片，指定size
UIImage *SWImageFromColorWithSize(UIColor *color, CGSize size) {
    UIGraphicsBeginImageContext(size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
// 通过颜色转化一定大小的圆形图片
UIImage *SWEllipseImageFromColorWithSize(UIColor *color, CGSize size) {
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0f);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillEllipseInRect(contextRef, CGRectMake(0.0f, 0.0f, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
// 头像占位图
UIImage *SWAvatarPlaceholderImage(void) {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = SWImageWithName(@"common_avatar_placeholder");
    });
    return image;
}
// 头像占位图（深灰 60*60）
UIImage *SWAvatarPlaceholder_gray60(void) {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = SWImageWithName(@"common_avatar_placeholder_gray60");
    });
    return image;
}
// 头像占位图（深灰 42*42）
UIImage *SWAvatarPlaceholder_gray42(void) {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = SWImageWithName(@"common_avatar_placeholder_gray42");
    });
    return image;
}
// 群头像占位图
UIImage *SWGroupAvatarPlaceholderImage(void) {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = SWImageWithName(@"common_groupavatar_placeholder");
    });
    return image;
}
UIImage *SWBackImage(void) {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = SWImageWithName(@"common_icon_navbar_back");
    });
    return image;
}

/**
 根据CIImage生成指定大小的UIImage
 
 @param image CIImage
 @param size 图片尺寸
 @return 生成的高清的UIImage
 */
UIImage *SWClearImageFormCIImage(CIImage *image, CGSize size) {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat widthScale = size.width/CGRectGetWidth(extent);
    CGFloat heightScale = size.height/CGRectGetHeight(extent);
    
    // 1. 创建bitmap
    size_t width = CGRectGetWidth(extent) * widthScale;
    size_t height = CGRectGetHeight(extent) * heightScale;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, widthScale, heightScale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    UIImage *clearImage = [UIImage imageWithCGImage:scaledImage];
    CGImageRelease(scaledImage);
    return clearImage;
}

/**
 生成二维码

 @param url 要生成二维码的url
 @param size 图片尺寸
 @return 二维码UIImage
 */
UIImage *SWQRCodeImageForUrl(NSString *url, CGSize size) {
    // 1.创建过滤器，这里的@"CIQRCodeGenerator"是固定的
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.恢复默认设置
    [filter setDefaults];
    
    // 3. 给过滤器添加数据
    NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding];
    // 注意，这里的value必须是NSData类型
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 4. 生成二维码
    CIImage *outputImage = [filter outputImage];
    
    // 5. 显示二维码
    UIImage *image = SWClearImageFormCIImage(outputImage, size);
    return image;
}


