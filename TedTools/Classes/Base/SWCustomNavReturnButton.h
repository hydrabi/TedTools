//
//  SWCustomNavReturnButton.h
//  SameWay
//
//  Created by zhihuihl on 2017/10/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWCustomNavigaitonView.h"

@interface SWCustomNavReturnButton : UIButton
@property (strong, nonatomic) UIImageView *backImage;
@property (strong, nonatomic) UILabel *backLabel;
//字体风格
@property (nonatomic,assign)NavigationTintStyle tintStyle;

/**
 初始化的同时带上字体风格

 @param tintStyle 字体风格
 @return 自定义的返回按钮
 */
-(instancetype)initWithTintStyle:(NavigationTintStyle)tintStyle;
@end
