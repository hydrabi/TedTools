//
//  SWCustomNavButton.h
//  SameWay
//
//  Created by zhihuihl on 2018/4/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWCustomNavButton : UIButton

/**
 标记数字label
 */
@property (nonatomic, strong) UILabel * badgeLabel;

-(void)resetValueWithNumber:(NSInteger)number;

-(void)hideBadgeLabel;
@end
