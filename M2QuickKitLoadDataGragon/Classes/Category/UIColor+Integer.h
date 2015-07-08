//
//  UIColor+Integer.h
//  Weather
//
//  Created by Wang.Xinlei on 8/30/13.
//  Copyright (c) 2013 Wxl.Haiyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Integer)

+ (UIColor *)colorWithRGB:(NSUInteger)rgb;
+ (UIColor *)colorWithRGBA:(NSUInteger)rgba;
+ (UIColor *)colorWithR:(NSUInteger)R G:(NSUInteger)G B:(NSUInteger)B;
+ (UIColor *)colorWithR:(NSUInteger)R G:(NSUInteger)G B:(NSUInteger)B A:(NSUInteger)A;

@end
