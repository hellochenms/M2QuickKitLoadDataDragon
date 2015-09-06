//
//  ErrorCodeHelper.m
//  M2QuickKitLoadDataDragon
//
//  Created by chenms.m2 on 15/7/8.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "ErrorCodeHelper.h"

@interface ErrorCodeHelper ()
@property (nonatomic) NSDictionary *codeMessageMapping;
@end

@implementation ErrorCodeHelper
+ (instancetype)sharedInstance {
    static ErrorCodeHelper * s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [ErrorCodeHelper new];
    });
    
    return s_instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.codeMessageMapping = @{};
    }
    
    return self;
}

- (NSString *)messageFromCode:(NSInteger)code {
    NSString *key = [NSString stringWithFormat:@"%ld", (long)code];
    NSString *message = [self.codeMessageMapping objectForKey:key];
    if ([NSString isEmpty:message]) {
        message = @"未知错误";
    }
    
    return message;
}

@end
