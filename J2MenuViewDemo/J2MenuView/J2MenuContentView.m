//
//  J2MenuContentView.m
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "J2MenuContentView.h"
#import "J2MenuViewDefine.h"
#import "J2MenuViewCCell.h"
//#import "IIMacro.h"

@interface J2MenuContentView ()
@property(nonatomic, strong) J2MenuHeaderView *headerView;
@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) UIButton *footerView;
@end

@implementation J2MenuContentView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat headerViewH = J2MENU_HEADERVIEW_HEIGHT;
    CGFloat footerViewH = 0.0;
    if (@available(iOS 11.0, *)) {
        footerViewH = J2MENU_FOOTERVIEW_HEIGHT;
    }
    CGFloat bottomPadding = J2MENU_BOTTOM_PADDING;
    CGRect slice, remainder;
    CGRectDivide(self.bounds, &slice, &remainder, headerViewH, CGRectMinYEdge);
    self.headerView.frame = slice;
    
    CGRectDivide(remainder, &slice, &remainder, bottomPadding, CGRectMaxYEdge);
    
    CGRectDivide(remainder, &slice, &remainder, footerViewH, CGRectMaxYEdge);
    self.footerView.frame = slice;
    
    self.collectionView.frame = remainder;
}

///MARK: - Privacy
- (void)addSubviews {
    [self addSubview:self.headerView];
    [self addSubview:self.collectionView];
    [self addSubview:self.footerView];
}

///MARK: - Getter && Setter
- (J2MenuHeaderView *)headerView {
    if (!_headerView) {
        J2MenuHeaderView *headerView = [[J2MenuHeaderView alloc] init];
        _headerView = headerView;
    }
    return _headerView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView = collectionView;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        //collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [collectionView registerClass:J2MenuViewCCell.class forCellWithReuseIdentifier:J2MenuViewCCell.description];
    }
    return _collectionView;
}

- (UIButton *)footerView {
    if (!_footerView) {
        UIButton *footerView = [[UIButton alloc] init];
        _footerView = footerView;
        [footerView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [footerView setTitle:@"×" forState:UIControlStateNormal];
        [footerView.titleLabel setFont:[UIFont systemFontOfSize:22.0]];
    }
    return _footerView;
}

@end
