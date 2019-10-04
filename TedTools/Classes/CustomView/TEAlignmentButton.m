//
//  TEAlignmentButton.m
//  PayChat
//
//  Created by iMac on 2018/10/19.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "TEAlignmentButton.h"

@implementation TEAlignmentButton

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self setAlignmentType:_alignmentType];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self setAlignmentType:_alignmentType];
}

-(void)setAlignmentType:(TEAlignmentButtonType)alignmentType{
    _alignmentType = alignmentType;
    
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    
    
    CGFloat space              = self.offset;
    CGFloat imageWidth         = self.imageView.frame.size.width;
    CGFloat imageHeight        = self.imageView.frame.size.height;
    CGFloat labelWidth         = self.titleLabel.frame.size.width;
    CGFloat labelHeight        = self.titleLabel.frame.size.height;
    CGFloat buttonHeight       = CGRectGetHeight(self.frame);
    CGFloat boundsCentery      = (imageHeight + space + labelHeight) * 0.5;
    CGFloat centerX_button     = CGRectGetMidX(self.bounds);// bounds
    CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
    CGFloat centerX_image      = CGRectGetMidX(self.imageView.frame);

    

    if(labelWidth == 0){
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth = titleSize.width;
    }
    
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;
    
    switch (self.alignmentType) {
        case TEAlignmentButtonTypeImageRight:
        {
            space = space * 0.5;
            imageInsetsLeft = labelWidth + space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = -(imageWidth + space);
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case TEAlignmentButtonTypeImageLeft:
        {
            space = space * 0.5;
            imageInsetsLeft = - space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case TEAlignmentButtonTypeImageBottom:
        {
            CGFloat imageBottomY       = CGRectGetMaxY(self.imageView.frame);
            CGFloat titleTopY          = CGRectGetMinY(self.titleLabel.frame);
            
            imageInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - imageBottomY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = (buttonHeight * 0.5 - boundsCentery) - titleTopY;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
        }
            break;
        case TEAlignmentButtonTypeImageTop:
        {
            CGFloat imageTopY = CGRectGetMinY(self.imageView.frame);
            CGFloat titleBottom = CGRectGetMaxY(self.titleLabel.frame);
            
            imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
        }
            break;
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, titleInsetsBottom, titleInsetsRight);
    
    [self layoutIfNeeded];
}

- (void)setOffset:(CGFloat)offset {
    _offset = offset;

    [self setAlignmentType:_alignmentType];
}

@end
