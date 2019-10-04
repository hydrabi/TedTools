//
//  CSAlignmentButton.h
//  PayChat
//
//  Created by iMac on 2018/10/19.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,TEAlignmentButtonType) {
    TEAlignmentButtonTypeImageLeft,
    TEAlignmentButtonTypeImageRight,
    TEAlignmentButtonTypeImageTop,
    TEAlignmentButtonTypeImageBottom,
};


@interface TEAlignmentButton : UIButton
#if TARGET_INTERFACE_BUILDER
@property(nonatomic, assign) IBInspectable NSUInteger alignmentType;
#else
@property(nonatomic, assign) TEAlignmentButtonType  alignmentType;
#endif

/**
 图片与文字之间的间隔
 */
@property(nonatomic, assign) IBInspectable CGFloat offset;

@end

