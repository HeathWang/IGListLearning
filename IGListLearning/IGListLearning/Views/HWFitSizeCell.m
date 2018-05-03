//
//  HWFitSizeCell.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWFitSizeCell.h"

@interface HWFitSizeCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation HWFitSizeCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }

    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }

    return self;
}

- (void)setupView {
    self.contentView.backgroundColor = [UIColor whiteColor];

    [self.contentView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(15, 15, 15, 15));
    }];
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {

    [self setNeedsLayout];
    [self layoutIfNeeded];

    CGSize size = [self.contentView systemLayoutSizeFittingSize:layoutAttributes.size];
    CGRect rect = layoutAttributes.frame;
    rect.size.width = ceilf(size.width);
    rect.size.height = ceilf(size.height);
    layoutAttributes.frame = rect;

    return layoutAttributes;
}

#pragma mark - Getter & Setter

- (NSString *)textString {
    return self.label.text;
}

- (void)setTextString:(NSString *)textString {
    self.label.text = textString;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor colorWithRed:0.106 green:0.678 blue:0.973 alpha:1.00];
    }
    return _label;
}


@end
