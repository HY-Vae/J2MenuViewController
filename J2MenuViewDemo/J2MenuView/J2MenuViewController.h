//
//  J2MenuViewController.h
//  ZYShareViewDemo
//
//  Created by whatsbug on 2019/4/29.
//  Copyright © 2019 tongbu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "J2MenuItem.h"
#import "J2MenuViewDefine.h"

NS_ASSUME_NONNULL_BEGIN

@protocol J2MenuViewControllerDelegate <NSObject>

@optional

- (void)menuViewController:(UIViewController *)menuViewController didSelectItem:(J2MenuItem *)item;
- (void)menuViewControllerDidClickIcon:(UIViewController *)menuViewController;
- (void)menuViewControllerDidClickTitle:(UIViewController *)menuViewController;
- (void)menuViewControllerDidClickRightButton:(UIViewController *)menuViewController;

@end

@interface J2MenuViewController : UIViewController

+ (void)showsInViewController:(UIViewController<J2MenuViewControllerDelegate> *)viewController
               withHeaderItem:(J2MenuHeaderItem *)item
                    menuItems:(NSArray<J2MenuItem *> *)items;

@end

NS_ASSUME_NONNULL_END
