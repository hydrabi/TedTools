//
//  SWCustomNavReturnButton.m
//  SameWay
//
//  Created by zhihuihl on 2017/10/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWCustomNavReturnButton.h"
#import <Masonry/Masonry.h>
static NSString * const backTitle = @"返回";

@implementation SWCustomNavReturnButton

-(instancetype)init{
    self = [super init];
    if(self){
        [self UIConfig];
    }
    return self;
}

-(instancetype)initWithTintStyle:(NavigationTintStyle)tintStyle{
    self = [super init];
    if(self){
        _tintStyle = tintStyle;
        [self UIConfig];
    }
    return self;
}

-(void)UIConfig{
    [self setUpSubView];
    [self layoutMySubView];
}

-(void)setUpSubView{
    self.backImage = [[UIImageView alloc] init];
    if(self.tintStyle == NavigationTintStyleWhite){
        [self.backImage setImage:[UIImage imageNamed:@"nav_back_white"]];
    }
    else{
        [self.backImage setImage:[UIImage imageNamed:@"nav_back_new"]];
    }
    
    [self addSubview:self.backImage];
}

-(void)layoutMySubView{
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.mas_equalTo(self);
        make.width.mas_equalTo(21);
        make.height.mas_equalTo(21);
        make.centerY.mas_equalTo(self);
    }];
    
}

@end
