//
//  UILayer+Gradient.m
//  XBLOCK
//
//  Created by iMac on 2019/4/28.
//  Copyright © 2019 Ted. All rights reserved.
//

#import "CALayer+Gradient.h"

@implementation CALayer (Gradient)

+(CAGradientLayer *)createGradientLayerWithIsVerticle:(BOOL)isVerticle colors:(NSArray*)colors size:(CGSize)size{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.colors = colors;
    layer.locations = @[@0.0,@1.0];
    
    if(isVerticle){
        layer.startPoint = CGPointMake(0.0f, 0.0f);
        layer.endPoint = CGPointMake(0.0f, 1.0f);
    }
    else{
        layer.startPoint = CGPointMake(0.0f, 0.0f);
        layer.endPoint = CGPointMake(1.0f, 0.0f);
    }
    
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    
    return layer;
}

@end
