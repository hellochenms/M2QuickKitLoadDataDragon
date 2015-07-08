//
//  M2FullScreenModalView.h
//  M2Common
//
//  Created by chenms.m2 on 15/7/3.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface M2FullScreenModalView : UIView
@property (nonatomic) UIView *contentView;
+ (instancetype)sharedInstance;
- (void)show;
- (void)hide;
@end
