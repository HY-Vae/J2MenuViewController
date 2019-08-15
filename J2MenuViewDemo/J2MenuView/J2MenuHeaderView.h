//
//  J2MenuTitleView.h
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class J2MenuHeaderItem;

@interface J2MenuHeaderView : UIView

@property(nonatomic, strong) J2MenuHeaderItem *item;
@property(nonatomic, strong, readonly) UIButton *iconButton;
@property(nonatomic, strong, readonly) UIButton *titleButton;
@property(nonatomic, strong, readonly) UIButton *rightButton;

@end

NS_ASSUME_NONNULL_END
