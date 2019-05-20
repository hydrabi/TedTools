//
//  SWBaseCollectionViewDataSource.h
//  SameWay
//
//  Created by zhihuihl on 2017/12/26.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWBaseViewModel.h"
#import "SWBaseViewController.h"
@interface SWBaseCollectionViewDataSource : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,weak)SWBaseViewModel *viewModel;
@property (nonatomic,weak)SWBaseViewController *viewController;
@property (nonatomic,weak)UICollectionView *collectionView;

-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel
                       collectionView:(UICollectionView*)collectionView;

-(void)registerCell;
-(void)initialize;
-(void)registerCellWithClass:(Class)class identifier:(NSString*)identifier;
-(void)registerSupplementaryHeaderViewWithClass:(Class)class identifier:(NSString*)identifier;
@end
