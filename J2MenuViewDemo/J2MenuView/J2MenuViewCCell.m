//
//  J2MenuViewCCell.m
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "J2MenuViewCCell.h"
#import "J2MenuViewDefine.h"
#import "UIView+J2Add.h"
#import "UIColor+J2Add.h"

@interface J2MenuViewCCell ()
@property(nonatomic, strong) UIButton *iconButton;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIView *indicatorView;
@end

@implementation J2MenuViewCCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    [self addSubview:self.iconButton];
    [self addSubview:self.titleLabel];
    [self addSubview:self.indicatorView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat labelHeight = J2MenuViewCCell.labelHeight;
    CGRect slice, remainder;
    CGRectDivide(self.bounds, &slice, &remainder, labelHeight, CGRectMaxYEdge);
    self.iconButton.frame = remainder;
    self.titleLabel.frame = CGRectInset(slice, -J2MENU_ITEMSPACING * 0.5, 0);
    
    self.indicatorView.size = CGSizeMake(12, 12);
    self.indicatorView.centerX = self.titleLabel.centerX + 15;
    self.indicatorView.centerY = self.titleLabel.centerY;
    self.indicatorView.layer.cornerRadius = self.indicatorView.size.width * 0.5;
    
    // cornerRadius
    self.iconButton.layer.cornerRadius = CGRectGetHeight(self.iconButton.frame) * 0.5;
}

///MARK: - Public
+ (CGFloat)labelHeight {
    return 31.0;
}

///MARK: - Getter && Setter
- (void)setItem:(J2MenuItem *)item {
    _item = item;
    
    UIImage *image = [UIImage imageNamed:item.icon];
    [self.iconButton setImage:image forState:UIControlStateNormal];
    self.titleLabel.text = item.title;
    self.indicatorView.hidden = !item.selected;
    self.iconButton.enabled = !item.disabled;
    self.titleLabel.enabled = !item.disabled;
    self.iconButton.alpha = item.disabled ? 0.3 : 1.0;
    self.titleLabel.alpha = item.disabled ? 0.3 : 1.0;
    
    self.iconButton.backgroundColor = UIColor.randomColor;
}

- (UIButton *)iconButton {
    if (!_iconButton) {
        UIButton *iconButton = [[UIButton alloc] init];
        _iconButton = iconButton;
        iconButton.clipsToBounds = YES;
        iconButton.userInteractionEnabled = NO;
        iconButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        _titleLabel = titleLabel;
        titleLabel.font = [UIFont systemFontOfSize:11];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.userInteractionEnabled = NO;
    }
    return _titleLabel;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        UIView *indicatorView = [[UIView alloc] init];
        _indicatorView = indicatorView;
        indicatorView.backgroundColor = UIColor.themeColor;
        indicatorView.alpha = 0.9;
        indicatorView.hidden = YES;
        
        indicatorView.layer.shadowOpacity = 0.5;
        indicatorView.layer.shadowRadius = 2.0;
        indicatorView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        indicatorView.layer.shadowColor = UIColor.blackColor.CGColor;
    }
    return _indicatorView;
}

@end
