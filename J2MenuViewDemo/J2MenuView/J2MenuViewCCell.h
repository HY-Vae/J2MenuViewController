//
//  J2MenuViewCCell.h
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "J2MenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface J2MenuViewCCell : UICollectionViewCell

@property(nonatomic, strong, readonly) UIButton *iconButton;
@property(nonatomic, strong) J2MenuItem *item;

+ (CGFloat)labelHeight;

@end

NS_ASSUME_NONNULL_END
