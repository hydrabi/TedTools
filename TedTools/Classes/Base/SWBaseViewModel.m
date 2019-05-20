//
//  SWBaseViewModel.m
//  SameWay
//
//  Created by zhihuihl on 2017/6/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseViewModel.h"

@implementation SWBaseViewModel
-(instancetype)init{
    self = [super init];
    if(self){
        [self baseInitialize];
        [self base_SetUpAttribute];
        [self base_setUpSignal];
        [self base_SetUpEventHandler];
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
}

-(void)baseInitialize{
    self.baseTableReloadSignal                                 = [[RACSubject subject] setNameWithFormat:@"baseTableReloadSignal"];
    self.baseSelectIndexPathSignal                             = [[RACSubject subject] setNameWithFormat:@"baseSelectIndexPathSignal"];
    self.baseRequestOperationQueue                             = [[NSOperationQueue alloc] init];
    self.baseRequestOperationQueue.maxConcurrentOperationCount = 1;
}

-(void)base_SetUpEventHandler{};
-(void)base_SetUpAttribute{};
-(void)base_setUpSignal{};
@end
