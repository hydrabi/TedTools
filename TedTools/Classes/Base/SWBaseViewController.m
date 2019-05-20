//
//  SWBaseViewController.m
//  SameWay
//
//  Created by zhihuihl on 2017/6/29.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseViewController.h"
#import "SWBaseViewModel.h"
#import "ReactiveCocoa.h"

@interface SWBaseViewController ()

@end

@implementation SWBaseViewController

-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if(self){
        self.viewModel                = viewModel;
        self.viewModel.viewController = self;

        @weakify(self)
        [[self rac_signalForSelector:@selector(viewDidLoad)]
         subscribeNext:^(id _){
             @strongify(self)
             [self bindViewModel];
         }];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    [self UIConfig];
}
#pragma mark - 绑定viewModel
-(void)bindViewModel{}
#pragma mark - 配置UI
-(void)UIConfig{}

-(void)base_UIConfig{
    
}

#pragma mark - 方法
-(void)base_loadMoreDate{
    
}

@end
