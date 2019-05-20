//
//  SWBaseViewModel.h
//  SameWay
//
//  Created by zhihuihl on 2017/6/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"

@class SWBaseViewController;
@interface SWBaseViewModel : NSObject
/**
 *  viewModel负责处理的控制器
 */
@property (nonatomic,weak)SWBaseViewController *viewController;

/**
 通知刷新信号
 */
@property (nonatomic,strong)RACSubject *baseTableReloadSignal;

/**
 选中某行的信号
 */
@property (nonatomic,strong)RACSubject *baseSelectIndexPathSignal;

#pragma mark - operationQueue

/**
 请求用的异步串行队列
 */
@property (nonatomic,strong)NSOperationQueue *baseRequestOperationQueue;

#pragma mark - 方法

/**
 *  初始化
 */
-(void)initialize;

-(void)base_SetUpEventHandler;
-(void)base_SetUpAttribute;
-(void)base_setUpSignal;
@end
