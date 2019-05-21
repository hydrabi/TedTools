//
//  CSQuickQueueOperation.h
//  PayChat
//
//  Created by iMac on 2018/6/23.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 获取GCD的队列
 */
@interface SWQuickQueueOperation : NSObject

/**
 全局队列
 
 @param block 需要执行的block
 */
+(void)getGloblQueueWithBlock:(void(^)(void))block;

/**
 主线程队列
 
 @param block 需要执行的block
 */
+(void)getMainQueueWithBlock:(void(^)(void))block;

/**
 在主线程中延迟执行
 
 @param second 延迟执行的时间
 @param block 需要执行的block
 */
+(void)getMainQueueAfterSecond:(CGFloat)second block:(void(^)(void))block;

@end
