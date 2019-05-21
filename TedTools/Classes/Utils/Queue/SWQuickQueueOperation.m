//
//  CSQuickQueueOperation.m
//  PayChat
//
//  Created by iMac on 2018/6/23.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "SWQuickQueueOperation.h"

@implementation SWQuickQueueOperation

+(void)getGloblQueueWithBlock:(void(^)(void))block{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(block){
            block();
        }
    });
}

+(void)getMainQueueWithBlock:(void(^)(void))block{
    if([NSThread isMainThread]){
        block();
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
            if(block){
                block();
            }
        });
    }
}

+(void)getMainQueueAfterSecond:(CGFloat)second block:(void(^)(void))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(block){
            block();
        };
    });
}

@end
