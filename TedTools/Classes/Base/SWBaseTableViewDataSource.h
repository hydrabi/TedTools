//
//  SWBaseTableViewDataSource.h
//  SameWay
//
//  Created by zhihuihl on 2017/10/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWBaseViewModel;
@class SWBaseViewController;
@interface SWBaseTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)SWBaseViewModel *viewModel;
@property (nonatomic,weak)SWBaseViewController *viewController;
@property (nonatomic,weak)UITableView *tableView;

-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel
                       tableView:(UITableView*)tableView;

-(void)registerCell;
-(void)initialize;
-(void)registerCellWithClass:(Class)class identifier:(NSString*)identifier;
-(void)registerHeaderFooterClass:(Class)class identifier:(NSString*)identifier;
-(void)base_bindViewModel;
@end
