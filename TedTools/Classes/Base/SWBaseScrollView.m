//
//  SWBaseScrollView.m
//  Original
//
//  Created by iMac on 2018/12/10.
//  Copyright © 2018年 毕志锋. All rights reserved.
//

#import "SWBaseScrollView.h"

@implementation SWBaseScrollView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
    [self.superview endEditing:YES];
}

@end
