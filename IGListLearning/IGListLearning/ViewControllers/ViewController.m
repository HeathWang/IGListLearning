//
//  ViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "ViewController.h"
#import "HWDemoItem.h"
#import "HWPullLoadingViewController.h"
#import "HWDemoSectionController.h"
#import "HWSingleSectionViewController.h"
#import "HWSearchViewController.h"
#import "HWMixDataTypeViewController.h"
#import "HWNestedViewController.h"
#import "HWEmptyDataViewController.h"
#import "HWWorkingRangeViewController.h"
#import "HWSelfSizingCellsViewController.h"

@interface ViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Demo";
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.items;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [HWDemoSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (NSArray *)items {
    if (!_items) {
        _items = @[[[HWDemoItem alloc] initWithDemoName:@"Pull Loading More Data." controllerClass:NSStringFromClass(HWPullLoadingViewController.class)],
                  [[HWDemoItem alloc] initWithDemoName:@"Merge Data to Single Section, use Collection Like a Plain or a Group TableView.Include Header and Footer." controllerClass:NSStringFromClass(HWSingleSectionViewController.class)],
                   [[HWDemoItem alloc] initWithDemoName:@"Search Auto Complete" controllerClass:NSStringFromClass(HWSearchViewController.class)],
                   [[HWDemoItem alloc] initWithDemoName:@"Mix Data, include multiple data type in list." controllerClass:NSStringFromClass(HWMixDataTypeViewController.class)],
                   [[HWDemoItem alloc] initWithDemoName:@"Nested Adapter, a controller cell include another UICollectionView" controllerClass:NSStringFromClass(HWNestedViewController.class)],
                   [[HWDemoItem alloc] initWithDemoName:@"Empty DataView" controllerClass:NSStringFromClass(HWEmptyDataViewController.class)],
                   [[HWDemoItem alloc] initWithDemoName:@"Working Range" controllerClass:NSStringFromClass(HWWorkingRangeViewController.class)],
                   [[HWDemoItem alloc] initWithDemoName:@"Self Sizeing" controllerClass:NSStringFromClass(HWSelfSizingCellsViewController.class)]];
    }
    return _items;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}


@end
