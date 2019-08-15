//
//  ViewController.m
//  J2MenuViewDemo
//
//  Created by whatsbug on 2019/8/14.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "ViewController.h"
#import "J2MenuViewController.h"

@interface ViewController ()<J2MenuViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * 这个组件是从我开发的biubiu浏览器中分离出来的，具体效果可以到这里查看：https://apps.apple.com/cn/app/id1474593656
     * github链接：https://github.com/whatsbug/J2MenuViewController
     */
}

- (IBAction)buttonDidClick:(id)sender {
    J2MenuHeaderItem *item = [J2MenuHeaderItem itemWithTitle:@"你好" icon:@"🐼" rightTitle:@"设置"];
    NSArray *itemArray = ViewController.menuItems;
    [J2MenuViewController showsInViewController:self withHeaderItem:item menuItems:itemArray];
}

- (void)performBlock:(void(^)(void))block afterDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !block ?: block();
    });
}

///MARK: - J2MenuViewControllerDelegate
- (void)menuViewController:(UIViewController *)menuViewController didSelectItem:(nonnull J2MenuItem *)item {
    NSLog(@"====%@", item.title);
    
    if ([item.title isEqualToString:@"小工具"]) {
        [self performBlock:^{
            J2MenuHeaderItem *item = [J2MenuHeaderItem itemWithTitle:@"你好" icon:@"🐶" rightTitle:@"设置"];
            NSArray *itemArray = ViewController.toolMenuItems;
            [J2MenuViewController showsInViewController:self withHeaderItem:item menuItems:itemArray];
        } afterDelay:J2MENU_ANIMATIONDURATION];
    }
}

- (void)menuViewControllerDidClickIcon:(UIViewController *)menuViewController {
    NSLog(@"====App Store: biubiu浏览器");
}

- (void)menuViewControllerDidClickTitle:(UIViewController *)menuViewController {
    NSLog(@"====App Store: biubiu浏览器");
}

- (void)menuViewControllerDidClickRightButton:(UIViewController *)menuViewController {
    NSLog(@"====App Store: biubiu浏览器");
}

///MARK: - J2MenuItem
+ (NSArray<J2MenuItem *> *)menuItems {
    J2MenuItem *item0 = [J2MenuItem itemWithTitle:@"分享" icon:@"pop_menu_share"];
    item0.disabled = YES;
    J2MenuItem *item1 = [J2MenuItem itemWithTitle:@"加入收藏" icon:@"pop_menu_collect"];
    item1.disabled = YES;
    J2MenuItem *item2 = [J2MenuItem itemWithTitle:@"小工具" icon:@"pop_menu_widget"];
    J2MenuItem *item3 = [J2MenuItem itemWithTitle:@"全屏"icon:@"pop_menu_full_screen"];
    item3.selected = YES;
    item3.disabled = YES;
    J2MenuItem *item4 = [J2MenuItem itemWithTitle:@"首页" icon:@"pop_menu_home"];
    J2MenuItem *item5 = [J2MenuItem itemWithTitle:@"无痕" icon:@"pop_menu_modes_secret"];
    item5.selected = YES;
    J2MenuItem *item6 = [J2MenuItem itemWithTitle:@"收藏/历史" icon:@"pop_menu_favorites"];
    J2MenuItem *item7 = [J2MenuItem itemWithTitle:@"刷新" icon:@"pop_menu_refresh"];
    J2MenuItem *item8 = [J2MenuItem itemWithTitle:@"加到首页" icon:@"pop_menu_navigator"];
    J2MenuItem *item9 = [J2MenuItem itemWithTitle:@"稍后浏览" icon:@"pop_menu_float_tab"];
    NSArray *itemArray = @[item0, item1, item2, item3, item4, item5, item6, item7, item8, item9];
    return itemArray;
}

+ (NSArray<J2MenuItem *> *)toolMenuItems {
    J2MenuItem *item0 = [J2MenuItem itemWithTitle:@"页内搜索" icon:@"pop_menu_find_in_page"];
    J2MenuItem *item1 = [J2MenuItem itemWithTitle:@"UA设置" icon:@"pop_menu_user_agent"];
    J2MenuItem *item2 = [J2MenuItem itemWithTitle:@"搜索引擎" icon:@"pop_menu_search_engine"];
    J2MenuItem *item3 = [J2MenuItem itemWithTitle:@"扫码" icon:@"pop_menu_qrcode_scan"];
    J2MenuItem *item4 = [J2MenuItem itemWithTitle:@"锁定方向" icon:@"pop_menu_lock"];
    item4.selected = YES;
    NSArray *itemArray = @[item0, item1, item2, item3, item4];
    return itemArray;
}

@end
