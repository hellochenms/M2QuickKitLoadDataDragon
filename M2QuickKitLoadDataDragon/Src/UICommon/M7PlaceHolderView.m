//
//  M2PlaceHolderView.m
//  M2Common
//
//  Created by chenms.m2 on 15/6/29.
//  Copyright (c) 2015年 chenms.m2. All rights reserved.
//

#import "M7PlaceHolderView.h"
#import <Masonry/Masonry.h>

// custom point
static NSString * const s_imageName = @"common_placeholder";

@interface M7PlaceHolderView ()
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIColor *defaultBgColor;
@end

@implementation M7PlaceHolderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildSubViews];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self buildSubViews];
}

- (void)buildSubViews {
    self.clipsToBounds = YES;
    // custom point
    self.defaultBgColor = [UIColor colorWithRGB:0xe9e9e9];
    self.backgroundColor = self.bgColor ? self.bgColor : self.defaultBgColor;
    
    self.imageView = [UIImageView new];
    [self addSubview:_imageView];
    __weak typeof(self) weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = weakSelf;
        make.edges.equalTo(superView).with.insets(UIEdgeInsetsZero);
    }];
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageView.image = [UIImage imageNamed:self.imageName ? self.imageName : s_imageName];
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = _bgColor ? _bgColor : self.defaultBgColor;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:_imageName ? _imageName : s_imageName];
}

@end
