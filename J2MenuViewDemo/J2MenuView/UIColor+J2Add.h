//
//  UIColor+J2Add.h
//  J2MenuViewDemo
//
//  Created by whatsbug on 2019/8/14.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (J2Add)

+ (UIColor *)randomColor;
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;
+ (UIColor *)themeColor;

@end

NS_ASSUME_NONNULL_END
