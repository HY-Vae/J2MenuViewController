//
//  J2MenuViewController.m
//  ZYShareViewDemo
//
//  Created by whatsbug on 2019/4/29.
//  Copyright © 2019 tongbu. All rights reserved.
//

#import "J2MenuViewController.h"
#import "J2MenuContentView.h"
#import "UIView+J2Add.h"
#import "J2MenuViewCCell.h"

@interface J2MenuViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, weak) id<J2MenuViewControllerDelegate> delegate;
@property(nonatomic, strong) J2MenuHeaderItem *headerItem;
@property(nonatomic, strong) NSArray<J2MenuItem *> *itemArray;
@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) J2MenuContentView *contentView;
@property(nonatomic, weak, readonly) J2MenuHeaderView *headerView;
@property(nonatomic, weak, readonly) UICollectionView *collectionView;
@property(nonatomic, weak, readonly) UIButton *footerView;
@end

@implementation J2MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubviews];
    [self commonInit];
    [self addGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showAnimationWithCompletion:nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self updateCollectionViewLayout];
    
    // 横屏的情况下也始终保持contentView的宽不变
    CGFloat contentViewW = self.contentViewWidth;
    CGFloat tmpW = (CGRectGetWidth(self.view.bounds) - contentViewW) * 0.5;
    CGRect slice, remainder;
    CGRectDivide(self.view.bounds, &slice, &remainder, tmpW, CGRectMinXEdge);
    CGRectDivide(remainder, &slice, &remainder, tmpW, CGRectMaxXEdge);
    
    CGFloat contentViewH = self.contentViewHeight;
    CGRectDivide(remainder, &slice, &remainder, contentViewH, CGRectMaxYEdge);
    self.contentView.frame = slice;
    
    self.backgroundView.frame = self.view.bounds;
    
    // cornerRadius
    [self.contentView roundCorners:UIRectCornerTopLeft | UIRectCornerTopRight radius:16.0f];
}

///MARK: - Privacy
- (void)addSubviews {
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.contentView];
}

- (void)commonInit {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.headerView.item = self.headerItem;
    
    [self.footerView addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.iconButton addTarget:self action:@selector(didClickIconButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.titleButton addTarget:self action:@selector(didClickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.rightButton addTarget:self action:@selector(didClickRightButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self.backgroundView addGestureRecognizer:tap];
}

- (void)showAnimationWithCompletion:(void (^)(BOOL finished))completion {
    CGFloat viewOldTop = self.contentView.top;
    CGFloat viewNewTop = CGRectGetHeight(self.view.bounds);
    self.contentView.top = viewNewTop;
    self.contentView.hidden = NO;
    [UIView animateWithDuration:J2MENU_ANIMATIONDURATION animations:^{
        self.backgroundView.alpha = 0.25;
        self.contentView.top = viewOldTop;
    } completion:completion];
}

- (void)hideAnimationWithCompletion:(void (^)(BOOL finished))completion {
    CGFloat viewNewTop = CGRectGetHeight(self.view.bounds);
    [UIView animateWithDuration:J2MENU_ANIMATIONDURATION animations:^{
        self.backgroundView.alpha = 0;
        self.contentView.top = viewNewTop;
    } completion:completion];
}

- (void)hide {
    [self hideAnimationWithCompletion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (CGFloat)contentViewWidth {
    CGRect bounds = UIScreen.mainScreen.bounds;
    CGFloat width = CGRectGetWidth(bounds);
    CGFloat height = CGRectGetHeight(bounds);
    return fminf(width, height);
}

- (CGFloat)contentViewHeight {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    UIEdgeInsets inset = layout.sectionInset;
    CGSize itemSize = layout.itemSize;
    NSUInteger cols = J2MENU_COLS;
    NSUInteger rows = (self.itemArray.count - 1) / cols + 1;

    CGFloat FOOTERVIEW_HEIGHT = 0.0;
    if (@available(iOS 11.0, *)) {
        FOOTERVIEW_HEIGHT = J2MENU_FOOTERVIEW_HEIGHT;
    }
    CGFloat height = J2MENU_HEADERVIEW_HEIGHT + inset.top + itemSize.height * rows + (rows - 1) * J2MENU_LINESPACING + inset.bottom + FOOTERVIEW_HEIGHT + J2MENU_BOTTOM_PADDING;
    
    return height;
}

- (void)updateCollectionViewLayout {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat width = self.contentViewWidth;
    UIEdgeInsets inset = J2MENU_COLLECTIONVIEW_INSET;
    CGFloat margin = J2MENU_ITEMSPACING;
    NSUInteger cols = J2MENU_COLS;
    CGFloat itemW = (width - (cols - 1) * margin - inset.left - inset.right) / cols;
    CGFloat itemH = itemW + J2MenuViewCCell.labelHeight;
    
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = J2MENU_LINESPACING;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.sectionInset = inset;
}

///MARK: - Control Events
- (void)didClickIconButton:(id)sender {
    //[self hide];
    
    if ([self.delegate respondsToSelector:@selector(menuViewControllerDidClickIcon:)]) {
        [self.delegate menuViewControllerDidClickIcon:self];
    }
}

- (void)didClickTitleButton:(id)sender {
    //[self hide];
    
    if ([self.delegate respondsToSelector:@selector(menuViewControllerDidClickTitle:)]) {
        [self.delegate menuViewControllerDidClickTitle:self];
    }
}

- (void)didClickRightButton:(id)sender {
    [self hide];
    
    if ([self.delegate respondsToSelector:@selector(menuViewControllerDidClickRightButton:)]) {
        [self.delegate menuViewControllerDidClickRightButton:self];
    }
}

///MARK: - Public
+ (void)showsInViewController:(UIViewController<J2MenuViewControllerDelegate> *)viewController withHeaderItem:(J2MenuHeaderItem *)item menuItems:(NSArray<J2MenuItem *> *)items {
    J2MenuViewController *menuVC = [[self alloc] init];
    menuVC.modalPresentationStyle = UIModalPresentationCustom;
    menuVC.delegate = viewController;
    menuVC.headerItem = item;
    menuVC.itemArray = items;
    [viewController.presentedViewController dismissViewControllerAnimated:NO completion:nil];
    [viewController presentViewController:menuVC animated:NO completion:nil];
}

///MARK: - Getter && Setter
- (J2MenuContentView *)contentView {
    if (!_contentView) {
        J2MenuContentView *contentView = [[J2MenuContentView alloc] init];
        _contentView = contentView;
        contentView.hidden = YES;
        contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (J2MenuHeaderView *)headerView {
    return self.contentView.headerView;
}

- (UICollectionView *)collectionView {
    return self.contentView.collectionView;
}

- (UIButton *)footerView {
    return self.contentView.footerView;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        UIView *backgroundView = [[UIView alloc] init];
        _backgroundView = backgroundView;
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.alpha = 0.0;
    }
    return _backgroundView;
}

///MARK: - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    J2MenuViewCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:J2MenuViewCCell.description forIndexPath:indexPath];
    J2MenuItem *item = self.itemArray[indexPath.item];
    cell.item = item;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    J2MenuItem *item = self.itemArray[indexPath.item];
    if (item.disabled) {
        return;
    }
    
    // 隐藏
    [self hide];
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(menuViewController:didSelectItem:)]) {
        [self.delegate menuViewController:self didSelectItem:item];
    }
}

@end
