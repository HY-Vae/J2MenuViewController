//
//  J2MenuContentView.h
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "J2MenuHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface J2MenuContentView : UIView

@property(nonatomic, strong, readonly) J2MenuHeaderView *headerView;
@property(nonatomic, strong, readonly) UICollectionView *collectionView;
@property(nonatomic, strong, readonly) UIButton *footerView;

@end

NS_ASSUME_NONNULL_END
