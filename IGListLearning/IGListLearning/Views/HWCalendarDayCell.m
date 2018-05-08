//
//  HWCalendarDayCell.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWCalendarDayCell.h"
#import "HWMonth.h"

@interface HWCalendarDayCell ()

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *dotLabel;

@end

@implementation HWCalendarDayCell

- (void)setupViews {
    [super setupViews];

    [self.contentView addSubview:self.dayLabel];
    [self.contentView addSubview:self.dotLabel];

    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];

    [self.dotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
    }];
}


- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect rect = self.contentView.bounds;
    CGFloat cornerWidth = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect));
    self.dayLabel.layer.cornerRadius = cornerWidth / 2;
}


- (void)bindViewModel:(id)viewModel {
    if ([viewModel isKindOfClass:HWDayViewModel.class]) {
        HWDayViewModel *dayViewModel = viewModel;
        self.dayLabel.text = [NSString stringWithFormat:@"%ld", (long) dayViewModel.day];
        self.dayLabel.layer.borderColor = dayViewModel.isToday ? [UIColor redColor].CGColor : [UIColor clearColor].CGColor;
        self.dayLabel.backgroundColor = dayViewModel.selected ? [[UIColor redColor] colorWithAlphaComponent:0.4] : [UIColor clearColor];

        NSMutableString *string = [NSMutableString string];
        if (dayViewModel.appointmentCount > 0) {
            for (int i = 0; i < dayViewModel.appointmentCount; ++i) {
                [string appendString:@". "];
            }
        }

        self.dotLabel.text = string;
    }
}

#pragma mark - Getter

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [UILabel new];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.clipsToBounds = YES;
        _dayLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
        _dayLabel.layer.borderWidth = 2;
    }
    return _dayLabel;
}

- (UILabel *)dotLabel {
    if (!_dotLabel) {
        _dotLabel = [UILabel new];
        _dotLabel.textAlignment = NSTextAlignmentCenter;
        _dotLabel.textColor = [UIColor redColor];
        _dotLabel.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
    }
    return _dotLabel;
}


@end
