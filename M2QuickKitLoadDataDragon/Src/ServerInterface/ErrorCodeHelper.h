//
//  ErrorCodeHelper.h
//  M2QuickKitLoadDataDragon
//
//  Created by chenms.m2 on 15/7/8.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorCodeHelper : NSObject
+ (instancetype)sharedInstance;
- (NSString *)messageFromCode:(NSInteger)code;
@end
