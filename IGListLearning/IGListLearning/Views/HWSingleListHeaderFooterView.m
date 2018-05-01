//
//  HWSingleListHeaderFooterView.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSingleListHeaderFooterView.h"

@interface HWSingleListHeaderFooterView ()

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation HWSingleListHeaderFooterView

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
    [self addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.right.equalTo(@-14);
        make.centerY.equalTo(@0);
    }];
}

#pragma mark - Setter

- (void)setInfo:(NSString *)info {
    _info = [info mutableCopy];
    self.infoLabel.text = info;
}


#pragma mark - Getter

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.numberOfLines = 0;
        _infoLabel.font = [UIFont systemFontOfSize:14];
        _infoLabel.textColor = [UIColor whiteColor];
    }
    return _infoLabel;
}


@end
