//
//  J2MenuItem.h
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface J2MenuHeaderItem : NSObject
@property(nonatomic, strong) NSString *icon;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *rightTitle;
+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(NSString *)icon
                   rightTitle:(NSString *)rightTitle;

@end;


@interface J2MenuItem : NSObject

@property(nonatomic, strong) NSString *icon;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, assign) BOOL selected;
@property(nonatomic, assign) BOOL disabled;

+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(NSString *)icon;

@end

NS_ASSUME_NONNULL_END
