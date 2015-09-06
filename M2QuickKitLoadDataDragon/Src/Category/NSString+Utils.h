//
//  NSString+Utils.h
//  M2Common
//
//  Created by chenms on 15/1/28.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Utils)
+ (NSString *)nvl:(NSString *)srcString;
+ (NSString *)nvl:(NSString *)srcString replaceString:(NSString *)replaceString;
- (NSString *)trim;
+ (BOOL)isEmpty:(NSString *)text;
+ (NSString *)stringFromInteger:(NSInteger)value;
+ (NSString *)stringFromDouble:(double)value;
+ (NSMutableAttributedString *)attributedStringWithKey:(NSString *)key
                                               keyFont:(UIFont *)keyFont
                                          keyTextColor:(UIColor *)keyTextColor
                                                 value:(NSString *)value
                                             valueFont:(UIFont *)valueFont
                                        valueTextColor:(UIColor *)valueTextColor;
@end
