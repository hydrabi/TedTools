//
//  SWBaseTableViewDataSource.m
//  SameWay
//
//  Created by zhihuihl on 2017/10/25.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseTableViewDataSource.h"
#import "SWBaseViewModel.h"
#import "SWBaseViewController.h"
@implementation SWBaseTableViewDataSource


-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel
                       tableView:(UITableView*)tableView{
    self = [super init];
    if(self){
        _viewModel = viewModel;
        _tableView = tableView;
        _viewController = viewModel.viewController;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self registerCell];
        [self initialize];
    }
    return self;
    
}

-(void)registerCell{
    
}

-(void)initialize{
    
}

-(void)base_bindViewModel{
    @weakify(self)
    [self.viewModel.baseTableReloadSignal subscribeNext:^(id _){
        @strongify(self)
        [self.tableView reloadData];
    }];
}

-(void)registerCellWithClass:(Class)class identifier:(NSString*)identifier{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
}

-(void)registerHeaderFooterClass:(Class)class identifier:(NSString*)identifier{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(class) bundle:nil];
    [self.tableView registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
}

@end
