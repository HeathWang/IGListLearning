//
//  HWMonthTitleCell.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWMonthTitleCell.h"
#import "HWMonth.h"

@implementation HWMonthTitleCell

- (void)setupViews {
    [super setupViews];

    self.textLabel.font = [UIFont systemFontOfSize:18];
    self.textLabel.textColor = [UIColor lightGrayColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:HWMonthTitleViewModel.class]) {
        HWMonthTitleViewModel *monthTitleViewModel = viewModel;
        self.textLabel.text = monthTitleViewModel.name;
    }
}

@end
