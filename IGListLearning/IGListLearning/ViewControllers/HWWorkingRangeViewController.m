//
//  HWWorkingRangeViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWWorkingRangeViewController.h"
#import "HWWorkingRangeSectionController.h"

@interface HWWorkingRangeViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSArray *data;

@end

@implementation HWWorkingRangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    /*
     从这个例子可以看出，Working Range中，sectionController是不会重用的，但是cell是可以被重用的！
     */
    return [HWWorkingRangeSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
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

- (NSArray *)data {
    if (!_data) {
        NSMutableSet *set = [NSMutableSet set];
        for (int i = 0; i < 20; ++i) {
            NSNumber *number = @(arc4random_uniform(200) + 200);
            [set addObject:number];
        }
        _data = [set allObjects];
    }

    return _data;
}


@end
