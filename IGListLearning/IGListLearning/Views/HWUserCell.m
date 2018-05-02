//
//  HWUserCell.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWUserCell.h"

@interface HWUserCell ()

@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) UILabel *referLabel;

@end

@implementation HWUserCell

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
    [self.contentView addSubview:self.userLabel];
    [self.contentView addSubview:self.referLabel];

    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(@14);
    }];

    [self.referLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@-10);
    }];
}

- (void)setUser:(NSString *)username refer:(NSString *)refer {
    self.userLabel.text = username;
    self.referLabel.text = refer;
}

#pragma mark - Getter

- (UILabel *)userLabel {
    if (!_userLabel) {
        _userLabel = [UILabel new];
        _userLabel.font = [UIFont systemFontOfSize:13];
        _userLabel.textColor = [UIColor darkTextColor];
    }
    return _userLabel;
}

- (UILabel *)referLabel {
    if (!_referLabel) {
        _referLabel = [UILabel new];
        _referLabel.font = [UIFont systemFontOfSize:12];
        _referLabel.textColor = [UIColor lightGrayColor];
    }
    return _referLabel;
}


@end
