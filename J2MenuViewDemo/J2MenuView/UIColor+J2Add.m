//
//  UIColor+J2Add.m
//  J2MenuViewDemo
//
//  Created by whatsbug on 2019/8/14.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#import "UIColor+J2Add.h"

@implementation UIColor (J2Add)

+ (UIColor *)randomColor {
    CGFloat hue = (arc4random() % 100) / 100.0f;
    CGFloat saturation = (arc4random() % 100) / 100.0f;
    CGFloat brightness = (arc4random() % 100) / 100.0f;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1.0f];
}

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:1.0];
}

+ (UIColor *)themeColor {
    return [self colorWithRGB:0x4F21DC];
}

@end
