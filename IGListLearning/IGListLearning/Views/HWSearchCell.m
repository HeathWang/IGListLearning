//
//  HWSearchCell.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSearchCell.h"

@implementation HWSearchCell

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
    [self.contentView addSubview:self.searchBar];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.searchBar.frame = self.contentView.bounds;
}


//#pragma mark - Getter

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
    }
    return _searchBar;
}


@end
