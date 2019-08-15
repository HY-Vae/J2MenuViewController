//
//  J2MenuTitleView.m
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "J2MenuHeaderView.h"
#import "J2MenuViewDefine.h"
#import "J2MenuItem.h"
#import "UIView+J2Add.h"
#import "UIColor+J2Add.h"

@interface J2MenuHeaderView ()
@property(nonatomic, strong) UIButton *iconButton;
@property(nonatomic, strong) UIButton *titleButton;
@property(nonatomic, strong) UIButton *rightButton;
@end

@implementation J2MenuHeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.iconButton];
    [self addSubview:self.titleButton];
    [self addSubview:self.rightButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat padding = J2MENU_COLLECTIONVIEW_INSET.left * 0.75;
    CGFloat viewH = CGRectGetHeight(self.bounds);
    CGRect tmpFrame = CGRectMake(0, 0, viewH, viewH);
    self.iconButton.frame = CGRectInset(tmpFrame, padding, padding);
    
    CGFloat labelX = CGRectGetMaxX(self.iconButton.frame) + 9.0f;
    self.titleButton.left = labelX;
    self.titleButton.centerY = self.iconButton.centerY;
    
    CGFloat rightButtonW = 60.0f;
    CGFloat rightButtonH = 28.0f;
    self.rightButton.size = CGSizeMake(rightButtonW, rightButtonH);
    self.rightButton.centerY = self.iconButton.centerY;
    self.rightButton.right = CGRectGetMaxX(self.frame) - padding;

    // cornerRadius
    self.iconButton.layer.cornerRadius = self.iconButton.height * 0.5;
    self.rightButton.layer.cornerRadius = self.rightButton.height * 0.5;
}

///MARK: - Getter && Setter
- (void)setItem:(J2MenuHeaderItem *)item {
    _item = item;
    
    UIImage *image = [UIImage imageNamed:item.icon];
    [self.iconButton setImage:image forState:UIControlStateNormal];
    [self.iconButton setTitle:item.icon forState:UIControlStateNormal];
    [self.titleButton setTitle:item.title forState:UIControlStateNormal];
    [self.titleButton sizeToFit];
    [self.rightButton setTitle:item.rightTitle forState:UIControlStateNormal];
}

- (UIButton *)iconButton {
    if (!_iconButton) {
        UIButton *iconButton = [[UIButton alloc] init];
        _iconButton = iconButton;
        iconButton.clipsToBounds = YES;
        iconButton.backgroundColor = UIColor.themeColor;
        //iconButton.hidden = YES;
    }
    return _iconButton;
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        UIButton *titleButton = [[UIButton alloc] init];
        _titleButton = titleButton;
        [titleButton setTitleColor:UIColor.darkGrayColor forState:UIControlStateNormal];
        [titleButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [titleButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        //titleButton.hidden = YES;
    }
    return _titleButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        UIButton *rightButton = [[UIButton alloc] init];
        _rightButton = rightButton;
        [rightButton setBackgroundColor:UIColor.themeColor];
        [rightButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        
        rightButton.layer.shadowOpacity = 0.5;
        rightButton.layer.shadowOffset = CGSizeMake(3.0, 3.0);
        rightButton.layer.shadowColor = UIColor.blackColor.CGColor;
    }
    return _rightButton;
}

@end
