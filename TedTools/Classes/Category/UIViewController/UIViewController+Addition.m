//
//  UIViewController+Addition.m
//  XBLOCK
//
//  Created by iMac on 2019/5/10.
//  Copyright © 2019 Ted. All rights reserved.
//

#import "UIViewController+Addition.h"

@implementation UIViewController (Addition)

-(void)addition_addChildViewControllerWithVc:(UIViewController*)childViewController{
    [self addChildViewController:childViewController];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

-(void)addition_removeChildViewController{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
