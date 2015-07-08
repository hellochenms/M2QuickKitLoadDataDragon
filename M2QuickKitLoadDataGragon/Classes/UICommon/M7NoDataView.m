//
//  M7NoDataView.m
//  M2Common
//
//  Created by chenms.m2 on 15/7/3.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "M7NoDataView.h"
#import <Masonry/Masonry.h>

// custom point
static NSString * const s_imageName = @"common_nodata";

@interface M7NoDataView ()
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIColor *defaultBgColor;
@end

@implementation M7NoDataView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self buildUI];
}

- (void)buildUI {
    // custom point
    self.defaultBgColor = [UIColor clearColor];
    self.backgroundColor = self.bgColor ? self.bgColor : self.defaultBgColor;
    
    self.imageView = [UIImageView new];
    [self addSubview:_imageView];
    __weak typeof(self) weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = weakSelf;
        
        // custom point
        make.width.equalTo(@260);
        make.height.equalTo(@240);
        make.centerX.equalTo(superView.mas_centerX).with.offset(0);
        make.centerY.equalTo(superView.mas_centerY).with.offset(0);
    }];
    self.imageView.image = [UIImage imageNamed:self.imageName ? self.imageName : s_imageName];
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapRetry)];
    [self addGestureRecognizer:tapRecognizer];
}

#pragma mark - user event
- (void)onTapRetry {
    if (self.tapRetryHandler) {
        self.tapRetryHandler();
    }
}

#pragma mark - setter/getter
- (void)setImageName:(NSString *)imageName {
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:_imageName ? _imageName : s_imageName];
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = _bgColor ? _bgColor : self.defaultBgColor;
}

@end
