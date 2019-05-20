//
//  SWBaseView.m
//  SameWay
//
//  Created by zhihuihl on 2017/10/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseXibView.h"

@implementation SWBaseXibView

+(instancetype)instanceSWBaseView{
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                 owner:nil
                                               options:nil];
    SWBaseXibView *view = (SWBaseXibView*)arr.firstObject;
    [view initialize];
    return arr.firstObject;
}

-(void)initialize{
    
}

@end
