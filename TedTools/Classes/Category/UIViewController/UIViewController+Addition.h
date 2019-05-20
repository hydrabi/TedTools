//
//  UIViewController+Addition.h
//  XBLOCK
//
//  Created by iMac on 2019/5/10.
//  Copyright © 2019 Ted. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Addition)

/**
 添加子控制器

 @param childViewController 子控制器
 */
-(void)addition_addChildViewControllerWithVc:(UIViewController*)childViewController;

/**
 从父视图中移除
 */
-(void)addition_removeChildViewController;
@end

NS_ASSUME_NONNULL_END
