//
//  CSBaseOperation.m
//  PayChat
//
//  Created by iMac on 2018/7/1.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "SWQuickBaseOperation.h"

@interface SWQuickBaseOperation()
/**
 是否完成
 */
@property (nonatomic,assign) BOOL finish;

/**
 是否正在执行中
 */
@property (nonatomic,assign) BOOL excuting;
@end

@implementation SWQuickBaseOperation

-(instancetype)init{
    self = [super init];
    if(self){
        _finish   = NO;
        _excuting = NO;
    }
    return self;
}

-(void)setOperationFinish:(BOOL)finish{
    [self willChangeValueForKey:@"isFinished"];
    self.finish = finish;
    [self didChangeValueForKey:@"isFinished"];
}

-(void)setOperationExcuting:(BOOL)excuting{
    [self willChangeValueForKey:@"isExecuting"];
    self.excuting = excuting;
    [self didChangeValueForKey:@"isExecuting"];
}

-(void)requestComplete{
    [self setOperationExcuting:NO];
    [self setOperationFinish:YES];
    
    if(self.shouldCheckComplete){
        //任务完成后
        
    }
}

-(void)requestStart{
    if([self isCancelled]){
        [self setOperationFinish:YES];
    }
    [self setOperationExcuting:YES];

}

-(BOOL)isAsynchronous{
    return YES;
}

-(BOOL)isExecuting{
    return self.excuting;
}

-(BOOL)isFinished{
    return self.finish;
}

@end
