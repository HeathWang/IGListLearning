//
//  HWRemoveCell.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWRemoveCell.h"

@interface HWRemoveCell ()

@property (nonatomic, strong) UILabel *removeLabel;
@property (nonatomic, strong) UILabel *indexLabel;

@end

@implementation HWRemoveCell

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
    self.contentView.backgroundColor = [UIColor whiteColor];

    [self.contentView addSubview:self.removeLabel];
    [self.contentView addSubview:self.indexLabel];

    [self.removeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.centerX.equalTo(self.contentView).offset(-40);
    }];

    [self.indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@-20);
    }];
}

#pragma mark - Setter

- (void)setIndex:(NSString *)index {
    _index = [index mutableCopy];
    self.indexLabel.text = [NSString stringWithFormat:@"Cell: %@", index];
}

- (void)setHighlighted:(BOOL)highlighted {
    
    self.contentView.backgroundColor = [UIColor colorWithWhite:highlighted ? 0.7 : 1 alpha:1];
}


#pragma mark - Getter

- (UILabel *)removeLabel {
    if (!_removeLabel) {
        _removeLabel = [UILabel new];

        _removeLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        _removeLabel.textColor = [UIColor blueColor];
        _removeLabel.text = @"Remove";
    }
    return _removeLabel;
}

- (UILabel *)indexLabel {
    if (!_indexLabel) {
        _indexLabel = [UILabel new];

        _indexLabel.font = [UIFont systemFontOfSize:14];
    }
    return _indexLabel;
}


@end
