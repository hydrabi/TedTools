//
//  UIView+Corners.h
//  XBLOCK
//
//  Created by Hydra on 2019/4/29.
//  Copyright © 2019 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Corners)

/**
 设置单个圆角
 
 @param radius 圆角半径
 @param corners 要设置圆角的角
 */
- (void)setMaskLayerWithCornerRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;

@end

NS_ASSUME_NONNULL_END
