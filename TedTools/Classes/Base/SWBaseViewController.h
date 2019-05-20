//
//  SWBaseViewController.h
//  SameWay
//
//  Created by zhihuihl on 2017/6/29.
//  Copyright © 2017年 Mac. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SWCustomNavigaitonView.h"


@class SWBaseViewModel;
@class SWTotooStyleMJFooterView;
@interface SWBaseViewController : UIViewController
#pragma mark - 基础属性
//属性，逻辑等的控制模型
@property (nonatomic,strong)SWBaseViewModel *viewModel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *navigationViewHeight;

/**
 导航栏
 */
@property (nonatomic, strong) SWCustomNavigaitonView * navigationView;

#pragma mark - 基础的subView

/**
 底部刷新视图
 */
@property (strong, nonatomic)SWTotooStyleMJFooterView *base_refreshFooterView;

/**
 配置UI
 */
-(void)UIConfig;

/**
 *  绑定viewModel
 */
-(void)bindViewModel;

-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel;

#pragma mark - 基础方法

/**
 底部刷新视图触发的方法
 */
-(void)base_loadMoreDate;

-(void)addGradientLayerWithTopColor:(UIColor*)topColor bottomColor:(UIColor*)bottomColor;
@end
