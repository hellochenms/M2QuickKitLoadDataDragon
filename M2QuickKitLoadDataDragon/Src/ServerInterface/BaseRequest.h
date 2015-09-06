//
//  CICBaseRequest.h
//  M2QuickKitLoadDataDragon
//
//  Created by chenms.m2 on 15/5/7.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "YTKRequest.h"

FOUNDATION_EXTERN NSString * const kCICBRErrorDomain;

@interface BaseRequest : YTKRequest
- (id)data;
- (NSError *)error;
@end
