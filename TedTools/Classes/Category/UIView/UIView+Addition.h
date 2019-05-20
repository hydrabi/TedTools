//
//  UIView+Addition.h
//  Original
//
//  Created by iMac on 2018/11/7.
//  Copyright © 2018年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//IB_DESIGNABLE

@interface UIView (Addition)

@property(nonatomic, assign) IBInspectable CGFloat or_cornerRadius;
@property(nonatomic, assign) IBInspectable CGFloat or_borderWidth;
@property(nonatomic, strong) IBInspectable UIColor * or_borderColor;
@property(nonatomic, strong) IBInspectable UIColor * or_layerColor;

@property(nonatomic, assign) IBInspectable CGSize or_shadowOffset;
@property(nonatomic, assign) IBInspectable CGFloat or_shadowRadius;
@property(nonatomic, assign) IBInspectable CGFloat or_shadowOpacity;
@property(nonatomic, strong) IBInspectable UIColor * or_shadowColor;
@end

NS_ASSUME_NONNULL_END
