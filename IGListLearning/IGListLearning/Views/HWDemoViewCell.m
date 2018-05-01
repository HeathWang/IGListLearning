//
//  HWDemoViewCell.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWDemoViewCell.h"

@interface HWDemoViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) CALayer *separatorLayer;

@end

@implementation HWDemoViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }

    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }

    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor whiteColor];

    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.centerY.equalTo(@0);
        make.right.equalTo(@-14);
    }];
    [self.contentView.layer addSublayer:self.separatorLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.contentView.bounds;
    self.separatorLayer.frame = CGRectMake(14, CGRectGetHeight(rect) - 0.5, CGRectGetWidth(rect) - 14, 0.5);
}

- (void)setHighlighted:(BOOL)highlighted {
    self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1];
}

#pragma mark - Getter

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (CALayer *)separatorLayer {
    if (!_separatorLayer) {
        _separatorLayer = [CALayer new];
        _separatorLayer.backgroundColor = [UIColor colorWithRed:200 / 255.0f green:199 / 255.0f blue:204 / 255.0f alpha:1].CGColor;
    }

    return _separatorLayer;
}


#pragma mark - Set name text

- (void)setNameText:(NSString *)nameText {
    _nameText = [nameText copy];
    self.nameLabel.text = nameText;
}


@end
