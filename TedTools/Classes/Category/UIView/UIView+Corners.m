//
//  UIView+Corners.m
//  XBLOCK
//
//  Created by Hydra on 2019/4/29.
//  Copyright © 2019 Ted. All rights reserved.
//

#import "UIView+Corners.h"

@implementation UIView (Corners)

/**
 设置单个圆角
 
 @param radius 圆角半径
 @param corners 要设置圆角的角
 */
- (void)setMaskLayerWithCornerRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners {
    UIBezierPath *payPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *payLayer = [[CAShapeLayer alloc] init];
    payLayer.frame = self.bounds;
    payLayer.path = payPath.CGPath;
    self.layer.mask = payLayer;
}

//获取快照
+(UIView*)getSnapshotWithInputView:(UIView*)inputView{
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image            = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIView *snapshot          = [[UIImageView alloc] initWithImage:image];
    return snapshot;
}

@end
