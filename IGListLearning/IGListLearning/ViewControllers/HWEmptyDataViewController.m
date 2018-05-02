//
//  HWEmptyDataViewController.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWEmptyDataViewController.h"
#import "HWEmptyResultView.h"
#import "HWRemoveSectionController.h"

@interface HWEmptyDataViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, assign) NSInteger startIndex;

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation HWEmptyDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.startIndex = 1;
    self.dataList = [NSMutableArray array];
    
    for (int i = 1; i < 8; ++i) {
        [self.dataList addObject:@(i)];
        self.startIndex ++;
    }

    [self.view addSubview:self.collectionView];

    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataList;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [HWRemoveSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return [HWEmptyResultView new];
}


#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}

@end
