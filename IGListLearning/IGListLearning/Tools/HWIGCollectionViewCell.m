//
//  HWIGCollectionViewCell.m
//  XiBeiYouMianCunIOS
//
//  Created by Heath on 2018/5/7.
//  Copyright © 2018 JHXD. All rights reserved.
//

#import "HWIGCollectionViewCell.h"

@interface HWIGCollectionViewCell ()

@property (nonatomic, strong) CALayer *separatorLayer;
@property(nonatomic, strong) UILabel *textLabel;

@end

@implementation HWIGCollectionViewCell

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
    // set up default
    self.cellStyle = IGCellStyleValue1;
    self.separatorStyle = IGCellSeparatorStyleSingleLine;
    self.separatorColor = [UIColor colorWithRed:200 / 255.0f green:199 / 255.0f blue:204 / 255.0f alpha:1];
    self.separatorInset = UIEdgeInsetsMake(0, 14, 0, 0);
    self.textLabelInset = UIEdgeInsetsMake(4, 14, 4, 14);

    [self.contentView.layer addSublayer:self.separatorLayer];
    [self.contentView addSubview:self.textLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect rect = self.contentView.bounds;

    if (self.separatorStyle == IGCellSeparatorStyleNone) {
        [self.separatorLayer removeFromSuperlayer];
    } else {

        CGFloat height = 1 / [UIScreen mainScreen].scale;
        self.separatorLayer.frame = CGRectMake(self.separatorInset.left, CGRectGetHeight(rect) - height - self.separatorInset.bottom, CGRectGetWidth(rect) - self.separatorInset.left - self.separatorInset.right, height);
    }

    if (self.cellStyle == IGCellStyleNone) {
        [_textLabel removeFromSuperview];
    } else {
        self.textLabel.frame = CGRectMake(self.textLabelInset.left, self.textLabelInset.top, CGRectGetWidth(rect) - (self.textLabelInset.left + self.textLabelInset.right), CGRectGetHeight(rect) - (self.textLabelInset.top + self.textLabelInset.bottom));
    }
}


#pragma mark - Setter

- (void)setSeparatorStyle:(IGCellSeparatorStyle)separatorStyle {

    if (_separatorStyle == separatorStyle)
        return;

    _separatorStyle = separatorStyle;
    if (separatorStyle == IGCellSeparatorStyleNone) {
        [_separatorLayer removeFromSuperlayer];
    } else if (separatorStyle == IGCellSeparatorStyleSingleLine) {
        if (![_separatorLayer superlayer]) {
            [self.contentView.layer addSublayer:self.separatorLayer];

            [self setNeedsLayout];
            [self layoutIfNeeded];
        }
    }

}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset {
    if (UIEdgeInsetsEqualToEdgeInsets(_separatorInset, separatorInset))
        return;

    _separatorInset = separatorInset;

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorColor = [separatorColor copy];
    self.separatorLayer.backgroundColor = separatorColor.CGColor;
}

- (void)setCellStyle:(IGCellStyle)cellStyle {

    if (_cellStyle == cellStyle)
        return;

    _cellStyle = cellStyle;
    if (cellStyle == IGCellSeparatorStyleNone) {
        [_textLabel removeFromSuperview];
    } else {
        if (![_textLabel superview]) {
            [self.contentView addSubview:self.textLabel];

            [self setNeedsLayout];
        }
    }
}


- (void)setTextLabelInset:(UIEdgeInsets)textLabelInset {

    if (UIEdgeInsetsEqualToEdgeInsets(_textLabelInset, textLabelInset))
        return;

    _textLabelInset = textLabelInset;

    [self setNeedsLayout];
}


#pragma mark - Getter

- (CALayer *)separatorLayer {
    if (!_separatorLayer) {
        _separatorLayer = [CALayer new];
        // set default color.
        _separatorLayer.backgroundColor = self.separatorColor.CGColor;
    }
    return _separatorLayer;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.numberOfLines = 0;
        _textLabel.textColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.00];
    }
    return _textLabel;
}


@end
