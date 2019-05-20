//
//  SWBaseEventHandler.m
//  SameWay
//
//  Created by zhihuihl on 2017/7/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseEventHandler.h"
#import "SWBaseViewModel.h"
@implementation SWBaseEventHandler

-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel{
    
    self = [super init];
    if(self){
        _viewModel      = viewModel;
        [self initialize];
        [self bindViewModel];
        
    }
    return self;
    
}

-(void)bindViewModel{}

-(void)initialize{}

-(SWBaseViewController*)viewController{
    return self.viewModel.viewController;
}

@end
