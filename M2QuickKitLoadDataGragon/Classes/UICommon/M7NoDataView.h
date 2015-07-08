//
//  M7NoDataView.h
//  M2Common
//
//  Created by chenms.m2 on 15/7/3.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface M7NoDataView : UIView
@property (nonatomic) UIColor *bgColor;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) void (^tapRetryHandler)(void);
@end
