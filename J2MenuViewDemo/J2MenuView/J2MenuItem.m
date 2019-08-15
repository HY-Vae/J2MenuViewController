//
//  J2MenuItem.m
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "J2MenuItem.h"

@implementation J2MenuItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon {
    J2MenuItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

@end


@implementation J2MenuHeaderItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon rightTitle:(NSString *)rightTitle {
    J2MenuHeaderItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    item.rightTitle = rightTitle;
    return item;
}

@end
