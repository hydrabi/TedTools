//
//  SWBaseEventHandler.h
//  SameWay
//
//  Created by zhihuihl on 2017/7/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWBaseViewModel;
@class SWBaseViewController;
@interface SWBaseEventHandler : NSObject

@property (nonatomic,weak)SWBaseViewModel *viewModel;

@property (weak, nonatomic)SWBaseViewController *viewController;

/**
 初始化的同时带上viewModel
 
 @param viewModel viewModel
 @return 事件处理
 */
-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel;

/**
 初始化
 */
-(void)initialize;

/**
 绑定viewModel
 */
-(void)bindViewModel;
@end
