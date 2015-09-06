//
//  NSString+Utils.h
//  M2Common
//
//  Created by chenms on 15/1/28.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)
+ (NSString *)nvl:(NSString *)srcString {
    return (srcString ? srcString : @"");
}

+ (NSString *)nvl:(NSString *)srcString replaceString:(NSString *)replaceString{
    return (srcString ? srcString : replaceString);
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (BOOL)isEmpty:(NSString *)text {
    return (!text || [text length] <= 0);
}

+ (NSString *)stringFromInteger:(NSInteger)value {
    return [NSString stringWithFormat:@"%ld", (long)value];
}

+ (NSString *)stringFromDouble:(double)value {
    return [NSString stringWithFormat:@"%.1f", value];
}

+ (NSMutableAttributedString *)attributedStringWithKey:(NSString *)key
                                               keyFont:(UIFont *)keyFont
                                          keyTextColor:(UIColor *)keyTextColor
                                                 value:(NSString *)value
                                             valueFont:(UIFont *)valueFont
                                        valueTextColor:(UIColor *)valueTextColor {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", key, value]];
    [attributedString addAttribute:NSFontAttributeName value:keyFont range:NSMakeRange(0, [key length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:keyTextColor range:NSMakeRange(0, [key length])];
    [attributedString addAttribute:NSFontAttributeName value:valueFont range:NSMakeRange([key length], [value length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:valueTextColor range:NSMakeRange([key length], [value length])];
    
    return attributedString;
}

@end
