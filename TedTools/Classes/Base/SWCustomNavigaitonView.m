//
//  SWCustomNavigaitonView.m
//  SameWay
//
//  Created by zhihuihl on 2017/10/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWCustomNavigaitonView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
#import "SWCustomNavButton.h"
#import "UIButton+TouchAreaInsets.h"
#import "UIColor+Addition.h"
#import "SWBaseMacro.h"

//取消按钮
static NSString * const cancelTitle = @"取消";
//取消按钮
static NSString * const closeTitle = @"关闭";
//完成
static NSString * const finishTitle = @"完成";

////状态栏高度
//static const CGFloat statusBarHeight = 20.0f;
const CGFloat firstItemOffset = 15.0f;
const CGFloat itemOffset = 17.0f;
const CGFloat itemWidthAndHeight = 22.0f;
const CGFloat titleFont = 18.0f;



@interface SWCustomNavigaitonView()
//回调
@property (nonatomic,copy) NavigationCallBack callBack;
//左边item枚举队列
@property (nonatomic,strong)NSArray *leftBtnsTypeArr;
//左边item队列
@property (nonnull,nonatomic,strong)NSMutableArray<UIView*> *leftBtnsArr;
//右边item枚举队列
@property (nonatomic,strong)NSArray *rightBtnsTypeArr;
//右边item队列
@property (nonnull,nonatomic,strong)NSMutableArray<UIView*> *rightBtnsArr;

//父视图控制器
@property (nonatomic,weak)UIViewController *parentViewController;
//居中的item类型
@property (nonatomic,assign)NavigationItemStyle middleStyle;
//字体风格
@property (nonatomic,assign)NavigationTintStyle tintStyle;
//右边的按钮的标题
@property (nonatomic,strong)NSArray *rightBtnsTitle;

@end

@implementation SWCustomNavigaitonView

+(instancetype)instanceWithParentView:(UIView*)parentView{
    SWCustomNavigaitonView *view = [[SWCustomNavigaitonView alloc] init];
    [parentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make){
        make.leading.top.trailing.mas_equalTo(parentView);
        make.height.mas_equalTo(NAVIGATION_BAR_HEIGHT);
    }];
    return view;
}

-(instancetype)init{
    self = [super init];
    if(self){
        [self initializeSubView];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initializeSubView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if(self.navDelegate && [self.navDelegate respondsToSelector:@selector(shouldLayoutSubView)]){
        [self.navDelegate shouldLayoutSubView];
    }
    [self updateMiddleItemConstraint];
}

//更新约束
-(void)updateMiddleItemConstraint{
    UIView *leftLastItem = [self.leftBtnsArr lastObject];
    UIView *rightLastItem = [self.rightBtnsArr lastObject];
    CGFloat leftMaxX = CGRectGetMaxX(leftLastItem.frame);
    CGFloat rightMinX = rightLastItem?Screen_Width - CGRectGetMinX(rightLastItem.frame):0;
    
    CGFloat maxOffset = MAX(fabs(leftMaxX), fabs(rightMinX));
    CGFloat width = Screen_Width - maxOffset * 2;
    
    if(self.middleStyle == NavigationStyleTitle){
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make){
            make.center.mas_equalTo(self.titleLabel.superview);
            make.width.mas_equalTo(width);
        }];
    }
    else if(self.middleStyle == NavigationStyleLogo){
        [self.middleItem mas_updateConstraints:^(MASConstraintMaker *make){
            make.width.mas_equalTo(49.0f);
            make.height.mas_equalTo(35.0f);
        }];
    }
}

#pragma mark - 属性初始化
-(NSMutableArray*)leftBtnsArr{
    if(_leftBtnsArr == nil){
        _leftBtnsArr = @[].mutableCopy;
    }
    return _leftBtnsArr;
}

-(NSMutableArray*)rightBtnsArr{
    if(_rightBtnsArr == nil){
        _rightBtnsArr = @[].mutableCopy;
    }
    return _rightBtnsArr;
}

-(void)initializeSubView{
    if(self.navigationBarView == nil){
        
        self.navigationBarView = [[UIView alloc] init];
        self.navigationBarView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.navigationBarView];
        
        //导航栏分隔的下划线
        UIView *bottomLine = [[UIView alloc] init];
        bottomLine.backgroundColor =UIColorFromRGB(0xebebeb);
        self.bottomLine = bottomLine;
        [self addSubview:bottomLine];
        
        @weakify(self)
        [self.navigationBarView mas_makeConstraints:^(MASConstraintMaker *make){
            @strongify(self)
            make.leading.mas_equalTo(self.mas_leading);
            make.trailing.mas_equalTo(self.mas_trailing);
            make.top.mas_equalTo(STATUS_BAR_HEIGHT);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make){
            make.leading.trailing.bottom.mas_equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
}

-(void)resetContentWithLeftBtnsType:(NSArray*)leftBtnsType
                          rightBtns:(NSArray*)rightBtnsType
                        middleStyle:(NavigationItemStyle)middleStyel
                          tintStyle:(NavigationTintStyle)tintStyle
                            handler:(NavigationCallBack)handler{
    self.callBack = handler;
    self.leftBtnsTypeArr  = leftBtnsType;
    self.rightBtnsTypeArr = rightBtnsType;
    self.middleStyle      = middleStyel;
    self.tintStyle        = tintStyle;
    [self.leftBtnsArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.rightBtnsArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.leftBtnsArr removeAllObjects];
    [self.rightBtnsArr removeAllObjects];
    [self.middleItem removeFromSuperview];
    self.middleItem = nil;
    
    [self createLeftButtons];
    [self createRightButtons];
    [self createMiddleItem];
}

-(void)resetContentWithLeftBtnsType:(NSArray*)leftBtnsType
                          rightBtns:(NSArray*)rightBtnsType
                      rightBtnTitle:(NSArray*)rightBtnTitles
                        middleStyle:(NavigationItemStyle)middleStyel
                          tintStyle:(NavigationTintStyle)tintStyle
                            handler:(NavigationCallBack)handler{
    
    self.rightBtnsTitle = rightBtnTitles;
    [self resetContentWithLeftBtnsType:leftBtnsType rightBtns:rightBtnsType middleStyle:middleStyel tintStyle:tintStyle handler:handler];
}

-(void)createLeftButtons{
    [self createItem:YES];
}

-(void)createRightButtons{
    [self createItem:NO];
}

-(void)createMiddleItem{
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    UIView *leftLastItem = [self.leftBtnsArr lastObject];
    UIView *rightLastItem = [self.rightBtnsArr lastObject];
    
    CGFloat leftMaxX = CGRectGetMaxX(leftLastItem.frame);
    CGFloat rightMinX = CGRectGetMinX(rightLastItem.frame);
    
    CGFloat maxOffset = MAX(fabs(leftMaxX), fabs(Screen_Width - rightMinX));
    CGFloat width = Screen_Width - maxOffset * 2;
    
    if(self.middleStyle == NavigationStyleTitle){
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [self getNavTitleColorWithCurrentTintStyle];
        
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
        label.tag = self.middleStyle;
        self.titleLabel = label;
        [self.navigationBarView addSubview:self.titleLabel];

    }
    else if(self.middleStyle == NavigationStyleLogo){
        self.middleItem = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navi_item_main_icon"]];
        [self.navigationBarView addSubview:self.middleItem];
        [self.middleItem mas_makeConstraints:^(MASConstraintMaker *make){
            make.center.mas_equalTo(self.navigationBarView);
            make.width.mas_equalTo(49.0f);
            make.height.mas_equalTo(35.0f);
        }];
    }
}

-(void)createItem:(BOOL)isLeft{
    NSArray *destTypeArr;
    NSMutableArray *destBtnsArr;
    if(isLeft){
        destTypeArr = self.leftBtnsTypeArr;
        destBtnsArr = self.leftBtnsArr;
    }
    else{
        destTypeArr = self.rightBtnsTypeArr;
        destBtnsArr = self.rightBtnsArr;
    }
    
    UIView *lastItem = nil;
    for(NSNumber *type in destTypeArr){
        UIView *item = [self createItemButtonWithType:[type integerValue]];
        
        //添加例外
        if(!isLeft){
            //自定义标题
            if([type integerValue] == NavigationStyleRightTitle){
                NSInteger index = [destTypeArr indexOfObject:type];
                if(self.rightBtnsTitle.count>index){
                    NSString *title = self.rightBtnsTitle[index];
                    if([item isKindOfClass:[UIButton class]]){
                        UIButton *button = (UIButton*)item;
                        [button setTitle:title forState:UIControlStateNormal];
                    }
                }
            }
        }
        
        [self.navigationBarView addSubview:item];
        [destBtnsArr addObject:item];
        if([item isKindOfClass:[UIButton class]]){
            [(UIButton*)item addTarget:self
                                action:@selector(buttonClickAction:)
                      forControlEvents:UIControlEventTouchUpInside];
        }
        
        [self makeConstraintsWithItem:item
                             lastItem:lastItem
                                 type:[type integerValue]
                               isLeft:isLeft];
        lastItem = item;
    }
}

-(UIView*)createItemButtonWithType:(NavigationItemStyle)type {
    if(type == NavigationStyleRightTitle){
        UIButton *btn = [[UIButton alloc] init];
        btn.touchAreaInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        [btn setTitleColor:[self getFontColorWithCurrentTintStyle] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        btn.tag = type;
        return btn;
    }
    else if(self.navDelegate && [self.navDelegate respondsToSelector:@selector(getItemViewWithItemStyle:)] &&
            (type == NavigationStyleQRCode)){
        UIButton *btn = [self.navDelegate getItemViewWithItemStyle:type];
        btn.touchAreaInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        btn.tag = type;
        return btn;
    }
    else{
        SWCustomNavButton *btn = [[SWCustomNavButton alloc] init];
        btn.touchAreaInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        [btn setImage:[self navigationImageWithType:type]
             forState:UIControlStateNormal];
        btn.tag = type;
        return btn;
    }
}

-(UIImage*)navigationImageWithType:(NavigationItemStyle)type{
    UIImage *image = nil;
    
    switch (type) {
        case NavigationStyleReturn:
        {
            image = [UIImage imageNamed:@"nav_return"];
        }
            break;
        case NavigationStyleReturnBlue:
        {
            image = [UIImage imageNamed:@"nav_return_blue"];
        }
            break;
        case NavigationStyleMenu:
        {
            image = [UIImage imageNamed:@"nav_menu"];
        }
            break;
        default:
            break;
    }
    return image;
}

//创建约束，添加内容
-(void)makeConstraintsWithItem:(UIView*)item lastItem:(UIView*)lastItem type:(NavigationItemStyle)type isLeft:(BOOL)isLeft{
    UIView *parentView = item.superview;
    [item mas_makeConstraints:^(MASConstraintMaker *make){
        
        CGFloat firOffset = firstItemOffset;
        if(self.navDelegate && [self.navDelegate respondsToSelector:@selector(getFirstItemOffset)] &&
           (type == NavigationStyleQRCode)){
            firOffset = [self.navDelegate getFirstItemOffset];
        }
        
        if(isLeft){
            //第一个屏幕距离15
            if(lastItem == nil){
                
                make.leading.mas_equalTo(parentView).offset(firOffset);
                
            }
        }
        else{
            if(lastItem == nil){
                make.trailing.mas_equalTo(parentView.mas_trailing).offset(-firOffset);
            }
            else{
                make.trailing.mas_equalTo(lastItem.mas_leading).offset(-itemOffset);
            }
        }
        
        if (type == NavigationStyleRightTitle){
            make.centerY.mas_equalTo(parentView);
        }
        else{
            make.centerY.mas_equalTo(parentView);
            
            if(self.navDelegate && [self.navDelegate respondsToSelector:@selector(getItemViewSizeWithItemStyle:)] &&
               (type == NavigationStyleQRCode)){
                CGSize size = [self.navDelegate getItemViewSizeWithItemStyle:type];
                make.width.mas_equalTo(size.width);
                make.height.mas_equalTo(size.height);
            }
            else{
                make.width.and.height.mas_equalTo(itemWidthAndHeight);
            }
        }
    }];
}

#pragma mark - 点击事件
-(void)buttonClickAction:(UIButton*)btn{
    if(self.callBack){
        self.callBack(btn.tag);
    }
}

#pragma mark - 获取指定风格的字体颜色
-(UIColor*)getFontColorWithCurrentTintStyle{
    UIColor *color = nil;
    switch (self.tintStyle) {
        case NavigationTintStyleWhite:
            color = [UIColor whiteColor];
            break;
        case NavigationTintStyleBlue:
            color = UIColorFromRGB(0x004181);
            break;
        default:
            break;
    }
    
    return color;
}

-(UIColor*)getNavTitleColorWithCurrentTintStyle{
    UIColor *color = nil;
    switch (self.tintStyle) {
        case NavigationTintStyleWhite:
            color = [UIColor whiteColor];
            break;
        case NavigationTintStyleBlue:
            color = UIColorFromRGB(0x004181);
            break;
        default:
            break;
    }
    
    return color;
}

#pragma mark - 设置背景颜色风格
-(void)resetNavigatonBgStyle:(NavigationBgStyle)style{
    switch (style) {
        case NavigationBgStyleWhite:
        {
            self.backgroundColor = [UIColor whiteColor];
        }
            break;
        case NavigationBgStyleBlue:
        {
            self.backgroundColor = UIColorFromRGB(0x05378B);
        }
            break;
            
        default:
            break;
    }
}

-(void)resetNavigatonBgColor:(UIColor*)color{
    self.backgroundColor = color;
}

#pragma mark - 获取指定类型的按钮
-(UIView*)getViewWithStyle:(NavigationItemStyle)style isLeft:(BOOL)isLeft{
    NSArray *viewArr = nil;
    if(isLeft){
        viewArr = self.leftBtnsArr;
    }
    else{
        viewArr = self.rightBtnsArr;
    }
    
    for(UIView *view in viewArr){
        if(view.tag == style){
            return view;
        }
    }
    
    return nil;
}

@end
