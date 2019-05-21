//
//  CSBaseOperation.h
//  PayChat
//
//  Created by iMac on 2018/7/1.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求回调
typedef void(^AdditionOperationCallback) (BOOL success,id result);

/**
 同步操作操作父类，保证操作串行异步
 */
@interface SWQuickBaseOperation : NSOperation

/**
 完成后是否发送通知
 */
@property (nonatomic, assign) BOOL shouldCheckComplete;

/**
 请求回调
 */
@property (nonatomic,copy)AdditionOperationCallback callback;

/**
 设置操作是否已经完成
 
 @param finish 完成为yes，否则为no
 */
-(void)setOperationFinish:(BOOL)finish;

/**
 设置操作是否在执行中
 
 @param excuting 执行中为yes，否则为no
 */
-(void)setOperationExcuting:(BOOL)excuting;

/**
 请求完成
 */
-(void)requestComplete;

/**
 请求开始
 */
-(void)requestStart;

@end
