//
//  SWShadeBackgroundXibView.h
//  SameWay
//
//  Created by zhihuihl on 2017/12/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseXibView.h"


/**
 带有背景遮罩的可点击隐藏的视图
 */
@interface SWShadeBackgroundXibView : SWBaseXibView<UIGestureRecognizerDelegate>

/** 点击隐藏响应手势 */
@property (strong,nonatomic) UITapGestureRecognizer *tapGesture;

/**
 遮罩前主要内容显示视图
 */
@property (weak,nonatomic) IBOutlet UIView *mainView;

/**
 是否已经在展示中
 */
@property (nonatomic,assign) BOOL hadShow;


/** 动画展示 */
-(void)show;
/** 动画隐藏 */
-(void)dismiss;

/**
 隐藏

 @param callback 隐藏后执行的回调
 */
-(void)dismissWithCallback:(void(^)(void))callback;
@end
