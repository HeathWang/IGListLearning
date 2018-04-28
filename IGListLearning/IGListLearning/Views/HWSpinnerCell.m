//
//  HWSpinnerCell.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSpinnerCell.h"

@interface HWSpinnerCell ()

@property (nonatomic, strong) UIActivityIndicatorView *spinnerView;

@end

@implementation HWSpinnerCell

#pragma mark - quick init a spinner sectionController

// 快捷初始化一个IGListSingleSectionController
+ (IGListSingleSectionController *)spinnerSectionController {
    IGListSingleSectionCellConfigureBlock cellConfig = ^(id item, __kindof UICollectionViewCell *cell){
        if ([cell isKindOfClass:HWSpinnerCell.class]) {
            HWSpinnerCell *spinnerCell = cell;
            [spinnerCell.spinnerView startAnimating];
        }
    };
    
    IGListSingleSectionCellSizeBlock sizeConfig = ^(id item, id<IGListCollectionContext> _Nullable collectionContext) {
        return CGSizeMake(collectionContext.containerSize.width, 68);
    };
    
    return [[IGListSingleSectionController alloc]initWithCellClass:HWSpinnerCell.class configureBlock:cellConfig sizeBlock:sizeConfig];
}

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
    self.contentView.backgroundColor = [UIColor whiteColor];

    [self.contentView addSubview:self.spinnerView];
    [self.spinnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointZero);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
}

#pragma mark - Getter

- (UIActivityIndicatorView *)spinnerView {
    if (!_spinnerView) {
        _spinnerView = [[UIActivityIndicatorView alloc] init];
        _spinnerView.color = [UIColor lightGrayColor];

    }
    return _spinnerView;
}


@end
