//
//  M2FullScreenModalView.m
//  M2Common
//
//  Created by chenms.m2 on 15/7/3.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "M2FullScreenModalView.h"
#import <Masonry/Masonry.h>

#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_0
#define kCFCoreFoundationVersionNumber_iOS_8_0 1129.15
#endif

@interface M2FullScreenModalView ()
@property (nonatomic) CGAffineTransform rotationTransform;
@end

@implementation M2FullScreenModalView

+ (instancetype)sharedInstance {
    static M2FullScreenModalView *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [M2FullScreenModalView new];
        [[UIApplication sharedApplication].keyWindow addSubview:s_instance];
    });
    
    return s_instance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        self.hidden = YES;
        
        [self registerForNotifications];
    }
    
    return self;
}

- (void)show {
    [self updateForCurrentOrientationAnimated:NO];
    self.hidden = NO;
}

- (void)hide {;
    self.hidden = YES;
}

- (void)registerForNotifications {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(statusBarOrientationDidChange:)
               name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)unregisterFromNotifications {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)statusBarOrientationDidChange:(NSNotification *)notification {
    UIView *superview = self.superview;
    if (!superview) {
        return;
    } else {
        [self updateForCurrentOrientationAnimated:YES];
    }
}

- (void)updateForCurrentOrientationAnimated:(BOOL)animated {
//      // Stay in sync with the superview in any case
//        if (self.superview) {
//            self.bounds = self.superview.bounds;
//            [self setNeedsDisplay];
//        }
    
    // Not needed on iOS 8+, compile out when the deployment target allows,
    // to avoid sharedApplication problems on extension targets
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000
    // Only needed pre iOS 7 when added to a window
    BOOL iOS8OrLater = kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0;
    if (iOS8OrLater || ![self.superview isKindOfClass:[UIWindow class]]) {
        self.frame = [UIApplication sharedApplication].keyWindow.frame;
        return;
    }
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    CGFloat radians = 0;
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        if (orientation == UIInterfaceOrientationLandscapeLeft) { radians = -(CGFloat)M_PI_2; }
        else { radians = (CGFloat)M_PI_2; }
// Window coordinates differ!
//        self.bounds = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.width);
    } else {
        if (orientation == UIInterfaceOrientationPortraitUpsideDown) { radians = (CGFloat)M_PI; }
        else { radians = 0; }
    }
    
    self.rotationTransform = CGAffineTransformMakeRotation(radians);
    
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
    }
    [self setTransform:self.rotationTransform];
    if (animated) {
        [UIView commitAnimations];
    }

    self.frame = [UIApplication sharedApplication].keyWindow.bounds;
#endif
}

#pragma mark - setter/getter
- (void)setContentView:(UIView *)contentView {
    [contentView removeFromSuperview];
    _contentView = contentView;
    [self addSubview:_contentView];
    [self layoutContentView];
}

- (void)layoutContentView {
    __weak typeof(self) weakSelf = self;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = weakSelf;
        make.width.equalTo(@(CGRectGetWidth(weakSelf.contentView.bounds)));
        make.height.equalTo(@(CGRectGetHeight(weakSelf.contentView.bounds)));
        make.centerX.equalTo(superView.mas_centerX).with.offset(0);
        make.centerY.equalTo(superView.mas_centerY).with.offset(0);
    }];
}

#pragma mark - dealloc
- (void)dealloc {
    [self unregisterFromNotifications];
}

@end
