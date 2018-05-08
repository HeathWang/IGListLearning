//
//  HWAnnouncingDepsViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWAnnouncingDepsViewController.h"
#import "HWIncrement.h"
#import "HWInjectionSC.h"

@interface HWAnnouncingDepsViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) HWIncrement *increment;

@end

@implementation HWAnnouncingDepsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIBarButtonItem *barButtonItemAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    self.navigationItem.rightBarButtonItem = barButtonItemAdd;
    self.increment = [HWIncrement new];

    NSMutableArray *mutableArray = [NSMutableArray array];
    for (int i = 0; i < 22; ++i) {
        [mutableArray addObject:@(i + 1)];
    }
    self.data = [mutableArray copy];

    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)addAction {
    [self.increment increment];
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
    return [[HWInjectionSC alloc] initWithIncrement:self.increment];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return [super emptyViewForListAdapter:listAdapter];
}

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:1];
    }
    return _adapter;
}

@end
