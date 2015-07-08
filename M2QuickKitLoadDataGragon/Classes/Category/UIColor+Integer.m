//
//  UIColor+Integer.m
//  Weather
//
//  Created by Wang.Xinlei on 8/30/13.
//  Copyright (c) 2013 Wxl.Haiyue. All rights reserved.
//

#import "UIColor+Integer.h"

@implementation UIColor (Integer)

+ (UIColor *)colorWithRGB:(NSUInteger)rgb {
    return [self colorWithR:((rgb >> 16) & 0xFF)
                          G:((rgb >> 8) & 0xFF)
                          B:(rgb & 0xFF)
                          A:0xFF];
}

+ (UIColor *)colorWithRGBA:(NSUInteger)rgba {
    return [self colorWithR:((rgba >> 24) & 0xFF)
                          G:((rgba >> 16) & 0xFF)
                          B:((rgba >> 8) & 0xFF)
                          A:(rgba & 0xFF)];
}

+ (UIColor *)colorWithR:(NSUInteger)R G:(NSUInteger)G B:(NSUInteger)B {
    return [self colorWithR:R G:G B:B A:255];
}

+ (UIColor *)colorWithR:(NSUInteger)R G:(NSUInteger)G B:(NSUInteger)B A:(NSUInteger)A {
    return [self colorWithRed:(R / 255.0) green:(G / 255.0) blue:(B / 255.0) alpha:(A / 255.0)];
}

@end
