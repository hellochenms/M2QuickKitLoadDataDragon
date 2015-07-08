//
//  M2NoTabBarController.h
//  M2Common
//
//  Created by chenms.m2 on 15/4/28.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface M2NoTabBarController : UIViewController
@property (nonatomic) NSArray *viewControllers;
@property (nonatomic,readonly) NSInteger selectedIndex;
- (void)selectAtIndex:(NSInteger)index;
@end
