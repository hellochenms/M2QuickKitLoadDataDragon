//
//  CICBaseRequest.m
//  M2QuickKitLoadDataGragon
//
//  Created by chenms.m2 on 15/5/7.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "BaseRequest.h"
#import "ErrorCodeHelper.h"

NSString * const kCICBRErrorDomain = @"kCICBRErrorDomain";

@implementation BaseRequest

- (NSDictionary *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    if ([headers count] <= 0) {
        return nil;
    }
    
    return headers;
}

- (id)data {
//    NSLog(@"self.responseString(%@)  %s", self.responseString, __func__);
    NSData *jsonData = [self.responseString dataUsingEncoding:NSUTF8StringEncoding];
    if (!jsonData) {
        return nil;
    }
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSInteger code = [[jsonDict objectForKey:@"code"] integerValue];
    if (code != 0) {
        return nil;
    }
    
    id data = [jsonDict objectForKey:@"data"];
    
    return data;
}

- (NSError *)error {
    NSData *jsonData = [self.responseString dataUsingEncoding:NSUTF8StringEncoding];
    if (!jsonData) {
        return nil;
    }
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSInteger code = [[jsonDict objectForKey:@"code"] integerValue];
    if (code == 0) {
        return nil;
    }
    
    NSString *message = [[ErrorCodeHelper sharedInstance] messageFromCode:code];
    
    NSDictionary *userInfo = nil;
    if (message) {
        userInfo = @{NSLocalizedDescriptionKey : message};
    }
    
    NSError *error = [NSError errorWithDomain:kCICBRErrorDomain code:code userInfo:userInfo];
    
    return error;
}

@end
