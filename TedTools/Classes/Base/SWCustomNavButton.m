//
//  SWCustomNavButton.m
//  SameWay
//
//  Created by zhihuihl on 2018/4/9.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "SWCustomNavButton.h"
#import <Masonry/Masonry.h>
#import "UIColor+Addition.h"

CGFloat static labelWidthAndHeight = 18.0f;

@implementation SWCustomNavButton

-(instancetype)init{
    self = [super init];
    if(self){
        [self setUpBadgeLabel];
        [self layoutBadgeLabel];
    }
    return self;
}

//设置未读数目label
-(void)setUpBadgeLabel{
    self.badgeLabel = [[UILabel alloc] init];
    self.badgeLabel.backgroundColor = UIColorFromRGB(0xff5a3b);
    self.badgeLabel.textColor = [UIColor whiteColor];
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.font = [UIFont systemFontOfSize:11];
    self.badgeLabel.hidden = YES;
    self.badgeLabel.clipsToBounds = YES;
    self.badgeLabel.layer.cornerRadius = labelWidthAndHeight/2;
    [self addSubview:self.badgeLabel];
}

-(void)resetValueWithNumber:(NSInteger)number{
    self.badgeLabel.hidden = NO;
    NSString *badgeString = @"";
    if(number > 99){
        badgeString = @"99+";
        self.badgeLabel.font = [UIFont systemFontOfSize:9];
    }
    else{
        self.badgeLabel.font = [UIFont systemFontOfSize:11];
        badgeString = [NSString stringWithFormat:@"%ld",(long)number];
    }
    self.badgeLabel.text = badgeString;
    
}

-(void)hideBadgeLabel{
    self.badgeLabel.hidden = YES;
}

-(void)layoutBadgeLabel{
    [self.badgeLabel mas_updateConstraints:^(MASConstraintMaker *make){
        make.width.mas_equalTo(labelWidthAndHeight);
        make.height.mas_equalTo(labelWidthAndHeight);
        make.leading.mas_equalTo(self.mas_trailing).offset(-8);
        make.bottom.mas_equalTo(self.mas_top).offset(8);
    }];
}

@end
