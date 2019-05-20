//
//  SWBaseCollectionViewDataSource.m
//  SameWay
//
//  Created by zhihuihl on 2017/12/26.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SWBaseCollectionViewDataSource.h"

@implementation SWBaseCollectionViewDataSource


-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel
                       collectionView:(UICollectionView*)collectionView{
    self = [super init];
    if(self){
        _viewModel = viewModel;
        _collectionView = collectionView;
        _viewController = viewModel.viewController;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self registerCell];
        [self initialize];
    }
    return self;
    
}

-(void)registerCell{
    
}

-(void)initialize{
    
}

-(void)registerCellWithClass:(Class)class identifier:(NSString*)identifier{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(class) bundle:nil];
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:identifier];
}

-(void)registerSupplementaryHeaderViewWithClass:(Class)class identifier:(NSString*)identifier{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(class)
                                      bundle:nil];
    [self.collectionView registerNib:nib
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:identifier];
}

@end
