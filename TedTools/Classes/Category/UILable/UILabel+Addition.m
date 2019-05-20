//
//  UILabel+Addition.m
//  XBLOCK
//
//  Created by iMac on 2019/5/14.
//  Copyright © 2019 Ted. All rights reserved.
//

#import "UILabel+Addition.h"
#import <objc/runtime.h>

@implementation UILabel (Addition)

-(void)setLocalize_text:(NSString *)localize_text{
    objc_setAssociatedObject(self, @selector(localize_text), localize_text, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.text = NSLocalizedString(localize_text, localize_text);
}

-(NSString*)localize_text{
    return objc_getAssociatedObject(self, @selector(localize_text));
}

@end
