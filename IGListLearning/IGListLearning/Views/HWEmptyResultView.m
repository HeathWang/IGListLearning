//
//  HWEmptyResultView.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWEmptyResultView.h"

@implementation HWEmptyResultView

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
    UILabel *label = [UILabel new];
    label.textColor = [UIColor blackColor];
    label.text = @"No More Data = =#";
    label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];

    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointZero);
    }];
}


@end
