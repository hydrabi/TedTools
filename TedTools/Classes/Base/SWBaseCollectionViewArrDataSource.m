//
//  SWBaseCollectionViewArrDataSource.m
//  XBLOCK
//
//  Created by iMac on 2019/5/8.
//  Copyright © 2019 Ted. All rights reserved.
//

#import "SWBaseCollectionViewArrDataSource.h"

@implementation SWBaseCollectionViewArrDataSource

-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel
                  collectionViewsArr:(NSArray*)collectionViewsArr{
    self = [super initWithViewModel:viewModel collectionView:nil];
    if(self){
        _colleciontViewsArr = collectionViewsArr;
        for(UICollectionView *view in collectionViewsArr){
            view.delegate = self;
            view.dataSource = self;
        }
        [self registerAllCollectionViewCell];
    }
    return self;
}

-(void)registerAllCollectionViewCell{
    
}

-(void)registerCellWithClass:(Class)class identifier:(NSString*)identifier collectionView:(UICollectionView*)collectionView{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(class) bundle:nil];
    [collectionView registerNib:nib
          forCellWithReuseIdentifier:identifier];
}

@end
