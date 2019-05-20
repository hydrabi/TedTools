//
//  SWBaseCollectionViewArrDataSource.h
//  XBLOCK
//
//  Created by iMac on 2019/5/8.
//  Copyright © 2019 Ted. All rights reserved.
//

#import "SWBaseCollectionViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface SWBaseCollectionViewArrDataSource : SWBaseCollectionViewDataSource
@property(nonatomic, strong) NSArray * colleciontViewsArr;
-(instancetype)initWithViewModel:(SWBaseViewModel*)viewModel
              collectionViewsArr:(NSArray*)collectionViewsArr;
-(void)registerCellWithClass:(Class)class identifier:(NSString*)identifier collectionView:(UICollectionView*)collectionView;
-(void)registerAllCollectionViewCell;
@end

NS_ASSUME_NONNULL_END
