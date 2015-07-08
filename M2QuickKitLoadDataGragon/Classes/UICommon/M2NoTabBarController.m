//
//  M2NoTabBarController.m
//  M2Common
//
//  Created by chenms.m2 on 15/4/28.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "M2NoTabBarController.h"

@interface M2NoTabBarController ()
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) NSMutableArray *innerViewControllers;
@end

@implementation M2NoTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _selectedIndex = NSNotFound;
    }
    
    return self;
}

#pragma mark - view controller life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self selectAtIndex:0];
}

#pragma mark -
- (void)selectAtIndex:(NSInteger)index {
    if ([self.innerViewControllers count] <= 0) {
        return;
    }
    if (index == self.selectedIndex) {
        return;
    }
    if (self.selectedIndex != NSNotFound) {
        UIViewController *fromViewController = [self.innerViewControllers objectAtIndex:self.selectedIndex];
        [fromViewController willMoveToParentViewController:nil];
        [fromViewController.view removeFromSuperview];
        [fromViewController removeFromParentViewController];
    }
    
    UIViewController *toViewController = [self.innerViewControllers objectAtIndex:index];
    
    [self addChildViewController:toViewController];
    
    toViewController.view.frame = self.view.bounds;
    [self.view addSubview:toViewController.view];
    
    [toViewController didMoveToParentViewController:self];
    
    self.selectedIndex = index;
}

#pragma mark - setter/getter
- (void)setViewControllers:(NSArray *)viewControllers {
    NSLog(@"  %s", __func__);
    // clear
    UIViewController *selectedViewController = [self.innerViewControllers objectAtIndex:self.selectedIndex];
    [selectedViewController willMoveToParentViewController:nil];
    [selectedViewController.view removeFromSuperview];
    [selectedViewController removeFromParentViewController];
    
    //
    self.innerViewControllers = [NSMutableArray arrayWithArray:viewControllers];
    [self selectAtIndex:0];
}
- (NSArray *)viewControllers {
    return [self.innerViewControllers copy];
}

@end
