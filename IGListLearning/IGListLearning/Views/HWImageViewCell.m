//
//  HWImageViewCell.m
//  IGListLearning
//
//  Created by Heath on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWImageViewCell.h"

@interface HWImageViewCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation HWImageViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViews];
    }

    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadViews];
    }

    return self;
}

- (void)loadViews {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.indicatorView];

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];

    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointZero);
    }];
}

- (void)setDownloadImage:(UIImage *)image {
    if (image) {
        self.imageView.image = image;
        [self.indicatorView stopAnimating];
    } else {
        [self.indicatorView startAnimating];
        self.imageView.image = nil;
    }
}

#pragma mark - Getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }

    return _imageView;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.color = [UIColor lightGrayColor];
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}


@end
