//
//  UIButton+HWAdd.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "UIButton+HWAdd.h"

@implementation UIButton (HWAdd)

+ (instancetype)navigationButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.165 green:0.427 blue:0.620 alpha:1.00] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];

    CGSize size = [button sizeThatFits:CGSizeMake(44, 44)];
    button.frame = CGRectMake(0, 0, size.width, size.height);

    return button;
}

@end
