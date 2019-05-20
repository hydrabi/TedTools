//
//  SWShadeBackgroundXibView.m
//  SameWay
//
//  Created by zhihuihl on 2017/12/1.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWShadeBackgroundXibView.h"

@implementation SWShadeBackgroundXibView

-(void)initialize{
    [super initialize];
    [self setUpGesture];
}

#pragma mark - TapGesture
//创建
-(void)setUpGesture{
    if(self.tapGesture == nil){
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
    action:@selector(tapAction:)];
        [self.tapGesture setNumberOfTapsRequired:1];
        [self addGestureRecognizer:self.tapGesture];
        self.tapGesture.delegate = self;
    }
}

-(void)tapAction:(UITapGestureRecognizer*)tap{
    if(tap.state == UIGestureRecognizerStateEnded){
        [self removeGestureRecognizer:tap];
        [self dismiss];
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    [self endEditing:YES];
    
    //参数nil表示坐标系统为window
    CGPoint location = [touch locationInView:nil];
    CGRect rect = self.mainView.frame;
    if(CGRectContainsPoint(rect, location)){
        return NO;
    }
    else{
        return YES;
    }
    
}

#pragma mark - 动画展示
-(void)show{
    if(!self.superview){
        
        self.hadShow = YES;
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        self.frame = [UIScreen mainScreen].bounds;
        [window addSubview:self];
        self.mainView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:0.6
              initialSpringVelocity:0.4
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.alpha=1;
                             self.mainView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
                         }completion:^(BOOL finish){
                             
                         }];
    }
}

-(void)dismiss{
    if(self.superview){
        
        self.hadShow = NO;

        [UIView animateWithDuration:0.3
                              delay:0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.alpha= 0.0f;
                             self.mainView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                         }completion:^(BOOL finish){
                             if(finish){
                                 [self removeFromSuperview];
                             }
                         }];
    }
}

-(void)dismissWithCallback:(void(^)(void))callback{
    if(self.superview){
        
        self.hadShow = NO;
        
        [UIView animateWithDuration:0.3
                              delay:0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.alpha= 0.0f;
                             self.mainView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                         }completion:^(BOOL finish){
                             if(finish){
                                 [self removeFromSuperview];
                                 if(callback){
                                     callback();
                                 }
                             }
                         }];
    }
}

@end
