//
//  SWCustomNavigaitonView.h
//  SameWay
//
//  Created by zhihuihl on 2017/10/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NavigationItemStyle){
    NavigationStyleNil,
    NavigationStyleReturn,                   /**<返回*/
    NavigationStyleReturnBlue,                   /**<返回*/
    NavigationStyleRightTitle,              /**<右边的任意字体按钮，需要带上标题*/

    NavigationStyleMenu,                    /**<菜单*/
    NavigationStyleQRCode,                  /**<二维码*/
    
    NavigationStyleTitle,                   /**<页面标题*/
    NavigationStyleLogo,                    /**<页面logo*/
};

typedef NS_ENUM(NSInteger,NavigationTintStyle) {
    NavigationTintStyleWhite,         /**<白色字体风格*/
    NavigationTintStyleBlue,         /**<绿色字体风格*/
};

typedef NS_ENUM(NSInteger,NavigationBgStyle) {
    NavigationBgStyleWhite,         /**<白色字体风格*/
    NavigationBgStyleBlue,         /**<绿色字体风格*/
};

//点击回调
typedef void (^NavigationCallBack)(NavigationItemStyle style);

@protocol SWCustomNavigaitonViewDelegate <NSObject>

-(UIButton*)getItemViewWithItemStyle:(NavigationItemStyle)itemStyle;
-(CGSize)getItemViewSizeWithItemStyle:(NavigationItemStyle)itemStyle;
-(void)shouldLayoutSubView;
-(CGFloat)getFirstItemOffset;
@end

@interface SWCustomNavigaitonView : UIView
//标题label
@property (nonatomic,weak)UILabel *titleLabel;
//居中的item
@property (nonatomic,strong)UIView *middleItem;
//分割线
@property (nonatomic,strong)UIView *bottomLine;
//导航栏图层 顶部间隔为20的状态栏高度
@property (nonatomic,strong)UIView *navigationBarView;
//自定义导航栏委托
@property(nonatomic, weak) id<SWCustomNavigaitonViewDelegate> navDelegate;
/**
 创建工厂实例

 @param parentView 父视图
 @return SWCustomNavigaitonView实例
 */
+(instancetype)instanceWithParentView:(UIView*)parentView;

-(void)resetContentWithLeftBtnsType:(NSArray*)leftBtnsType
                          rightBtns:(NSArray*)rightBtnsType
                        middleStyle:(NavigationItemStyle)middleStyel
                          tintStyle:(NavigationTintStyle)tintStyle
                            handler:(NavigationCallBack)handler;

-(void)resetContentWithLeftBtnsType:(NSArray*)leftBtnsType
                          rightBtns:(NSArray*)rightBtnsType
                      rightBtnTitle:(NSArray*)rightBtnTitles
                        middleStyle:(NavigationItemStyle)middleStyel
                          tintStyle:(NavigationTintStyle)tintStyle
                            handler:(NavigationCallBack)handler;

#pragma mark - 获取指定类型的按钮

/**
 获取指定类型的视图

 @param style 类型
 @param isLeft 是否是左边的item
 @return 指定类型的视图
 */
-(UIView*)getViewWithStyle:(NavigationItemStyle)style isLeft:(BOOL)isLeft;

#pragma mark - 获取指定风格的字体颜色
-(UIColor*)getFontColorWithCurrentTintStyle;

#pragma mark - 设置背景颜色风格
-(void)resetNavigatonBgStyle:(NavigationBgStyle)style;
//修改颜色
-(void)resetNavigatonBgColor:(UIColor*)color;

-(void)updateMiddleItemConstraint;
@end
