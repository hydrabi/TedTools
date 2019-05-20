//
//  UIView+Addition.m
//  Original
//
//  Created by iMac on 2018/11/7.
//  Copyright © 2018年 毕志锋. All rights reserved.
//

#import "UIView+Addition.h"
#import <objc/runtime.h>
@implementation UIView (Addition)

-(void)setOr_borderWidth:(CGFloat)or_borderWidth{
    objc_setAssociatedObject(self, @selector(or_borderWidth), @(or_borderWidth), OBJC_ASSOCIATION_ASSIGN);
    self.layer.borderWidth = or_borderWidth;
}

-(CGFloat)or_borderWidth{
    return [objc_getAssociatedObject(self, @selector(or_borderWidth)) floatValue];
}
    
-(void)setOr_cornerRadius:(CGFloat)or_cornerRadius{
    objc_setAssociatedObject(self, @selector(or_cornerRadius), @(or_cornerRadius), OBJC_ASSOCIATION_ASSIGN);
    
    self.layer.cornerRadius = or_cornerRadius;
    self.layer.masksToBounds = YES;
}
    
-(CGFloat)or_cornerRadius{
    return [objc_getAssociatedObject(self, @selector(or_cornerRadius)) floatValue];
}
    
-(void)setOr_borderColor:(UIColor *)or_borderColor{
    objc_setAssociatedObject(self, @selector(or_borderColor), or_borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderColor = or_borderColor.CGColor;
}
    
-(UIColor*)or_borderColor{
    return objc_getAssociatedObject(self, @selector(or_borderColor));
}

-(void)setOr_layerColor:(UIColor *)or_layerColor{
    objc_setAssociatedObject(self, @selector(or_layerColor), or_layerColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.backgroundColor = or_layerColor.CGColor;
    self.layer.masksToBounds = NO;
}

-(UIColor*)or_layerColor{
    return objc_getAssociatedObject(self, @selector(or_layerColor));
}

#pragma mark - shadow
//@property(nonatomic, assign) IBInspectable CGSize or_shadowOffset;
//@property(nonatomic, assign) IBInspectable CGFloat or_shadowRadius;
//@property(nonatomic, assign) IBInspectable CGFloat or_shadowOpacity;
//@property(nonatomic, strong) IBInspectable UIColor * or_shadowColor;

-(void)setOr_shadowOffset:(CGSize)or_shadowOffset{
    objc_setAssociatedObject(self, @selector(or_shadowOffset), [NSValue valueWithCGSize:or_shadowOffset], OBJC_ASSOCIATION_ASSIGN);
    self.layer.shadowOffset = or_shadowOffset;
}

-(CGSize)or_shadowOffset{
    return [objc_getAssociatedObject(self, @selector(or_shadowOffset)) CGSizeValue];
}

-(void)setOr_shadowRadius:(CGFloat)or_shadowRadius{
    objc_setAssociatedObject(self, @selector(or_shadowRadius), @(or_shadowRadius), OBJC_ASSOCIATION_ASSIGN);
    self.layer.shadowRadius = or_shadowRadius;
}

-(CGFloat)or_shadowRadius{
    return [objc_getAssociatedObject(self, @selector(or_shadowRadius)) floatValue];
}

-(void)setOr_shadowOpacity:(CGFloat)or_shadowOpacity{
    objc_setAssociatedObject(self, @selector(or_shadowOpacity), @(or_shadowOpacity), OBJC_ASSOCIATION_ASSIGN);
    self.layer.shadowOpacity = or_shadowOpacity;
}

-(CGFloat)or_shadowOpacity{
    return [objc_getAssociatedObject(self, @selector(or_shadowOpacity)) floatValue];
}

-(void)setOr_shadowColor:(UIColor *)or_shadowColor{
    objc_setAssociatedObject(self, @selector(or_shadowColor), or_shadowColor, OBJC_ASSOCIATION_RETAIN);
    self.layer.shadowColor = or_shadowColor.CGColor;
}

-(UIColor*)or_shadowColor{
    return objc_getAssociatedObject(self, @selector(or_shadowColor));
}

@end
