//
//  HWSelfSizingCellsViewController.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSelfSizingCellsViewController.h"
#import "HWSelfSizingSectionController.h"

@interface HWSelfSizingCellsViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSArray<HWSectionModel *> *data;

@end

@implementation HWSelfSizingCellsViewController

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
    return [HWSelfSizingSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.estimatedItemSize = CGSizeMake(100, 44);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor colorWithRed:0.698 green:0.843 blue:1.000 alpha:1.00];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}

- (NSArray<HWSectionModel *> *)data {
    if (!_data) {
        _data = @[[HWSectionModel modelWithItems:@[@"Leverage agile", @"frameworks", @"robust synopsis", @"high level", @"overviews", @"Iterative approaches", @"corporate strategy", @"foster collaborative", @"overall value", @"proposition", @"Organically grow", @"holistic world view", @"disruptive", @"innovation", @"workplace diversity", @"empowerment", @"a", @"v", @"Tikk"] sizingType:HWSelfSizingTypeFit],
                [HWSectionModel modelWithItems:@[@"Aenean lacinia bibendum nulla sed consectetur. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum.", @"Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere consectetur est at lobortis. Cras justo odio, dapibus ac facilisis in, egestas eget quam.", @"Sed posuere consectetur est at lobortis. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum."] sizingType:HWSelfSizingTypeFullWidth]];
    }
    return _data;
}


@end
