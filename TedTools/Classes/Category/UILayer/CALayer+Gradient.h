//
//  UILayer+Gradient.h
//  XBLOCK
//
//  Created by iMac on 2019/4/28.
//  Copyright © 2019 Ted. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Gradient)

+(CAGradientLayer *)createGradientLayerWithIsVerticle:(BOOL)isVerticle colors:(NSArray*)colors size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
