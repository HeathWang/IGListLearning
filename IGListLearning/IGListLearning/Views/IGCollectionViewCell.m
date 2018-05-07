//
//  IGCollectionViewCell.m
//  XiBeiYouMianCunIOS
//
//  Created by Heath on 2018/5/7.
//  Copyright © 2018 JHXD. All rights reserved.
//

#import "IGCollectionViewCell.h"

@interface IGCollectionViewCell ()

@property (nonatomic, strong) CALayer *separatorLayer;

@end

@implementation IGCollectionViewCell

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }

    return self;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }

    return self;
}

- (void)setupViews {
    self.separatorStyle = IGCellSeparatorStyleSingleLine;
    self.separatorInset = UIEdgeInsetsMake(0, 14, 0, 0);

    [self.contentView.layer addSublayer:self.separatorLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if (self.separatorStyle == IGCellSeparatorStyleNone) {
        [self.separatorLayer removeFromSuperlayer];
    } else {
        CGRect rect = self.contentView.bounds;
        CGFloat height = 1 / [UIScreen mainScreen].scale;
        self.separatorLayer.frame = CGRectMake(self.separatorInset.left, CGRectGetHeight(rect) - height - self.separatorInset.bottom, CGRectGetWidth(rect) - self.separatorInset.left - self.separatorInset.right, height);
    }
}


#pragma mark - Setter

- (void)setSeparatorStyle:(IGCellSeparatorStyle)separatorStyle {
    _separatorStyle = separatorStyle;

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset {
    _separatorInset = separatorInset;

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorColor = [separatorColor copy];
    self.separatorLayer.backgroundColor = separatorColor.CGColor;
}


#pragma mark - Getter

- (CALayer *)separatorLayer {
    if (!_separatorLayer) {
        _separatorLayer = [CALayer new];
        // set default color.
        _separatorLayer.backgroundColor = [UIColor colorWithRed:200 / 255.0f green:199 / 255.0f blue:204 / 255.0f alpha:1].CGColor;
    }
    return _separatorLayer;
}


@end
