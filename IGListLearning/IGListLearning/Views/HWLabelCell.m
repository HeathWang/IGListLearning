//
//  HWLabelCell.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWLabelCell.h"

#define kLabelCellInset     UIEdgeInsetsMake(8, 14, 8, 14)
#define kLabelCellFont      [UIFont systemFontOfSize:13]

@interface HWLabelCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CALayer *seperatorLayer;

@end

@implementation HWLabelCell

#pragma mark - init

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
    self.label.numberOfLines = 0;
    [self.contentView addSubview:self.label];
    [self.contentView.layer addSublayer:self.seperatorLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize contentSize = self.contentView.bounds.size;

    self.label.frame = UIEdgeInsetsInsetRect(self.contentView.bounds, kLabelCellInset);
    self.seperatorLayer.frame = CGRectMake(kLabelCellInset.left, contentSize.height - 0.5f, contentSize.width - kLabelCellInset.left, 0.5);
}

- (void)setContent:(NSString *)content {
    _content = [content mutableCopy];
    self.label.text = content;
}

#pragma mark - Class method

+ (CGFloat)singleCellHeight {
    return kLabelCellFont.lineHeight + kLabelCellInset.top + kLabelCellInset.bottom;
}

+ (CGFloat)cellHeightWithText:(NSString *)text width:(CGFloat)width {
    CGSize containerSize = CGSizeMake(width - kLabelCellInset.left - kLabelCellInset.right, CGFLOAT_MAX);
    CGRect rect = [text boundingRectWithSize:containerSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: kLabelCellFont} context:nil];
    return CGRectGetHeight(rect) + kLabelCellInset.top + kLabelCellInset.bottom;
}

#pragma mark - Getter

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.font = kLabelCellFont;
        _label.textColor = [UIColor darkGrayColor];
        _label.textAlignment = NSTextAlignmentLeft;
    }
    return _label;
}

- (CALayer *)seperatorLayer {
    if (!_seperatorLayer) {
        _seperatorLayer = [CALayer layer];
        _seperatorLayer.backgroundColor = [UIColor colorWithRed:200 / 255.0f green:199 / 255.0f blue:204 / 255.0f alpha:1].CGColor;
    }
    return _seperatorLayer;
}


@end
