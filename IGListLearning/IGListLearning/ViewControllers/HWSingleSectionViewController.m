//
//  HWSingleSectionViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSingleSectionViewController.h"
#import "HWListIntoSingleSectionController.h"
#import "NSArray+HW_IGListDiffable.h"
#import "UIButton+HWAdd.h"

@interface HWSingleSectionViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation HWSingleSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Normal TableView";
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];

    [self setupNav];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.shouldStickHeader) {
        IGListCollectionViewLayout *layout = (IGListCollectionViewLayout *) self.collectionView.collectionViewLayout;
        if (@available(iOS 11, *)) {
            layout.stickyHeaderYOffset = self.view.safeAreaInsets.top;
        } else {
            layout.stickyHeaderYOffset = self.topLayoutGuide.length;
        }
        
        self.collectionView.collectionViewLayout = layout;
    }
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)setupNav {
    if (!self.shouldStickHeader) {
        UIButton *button = [UIButton navigationButtonWithTitle:@"Make Stick"];
        [button addTarget:self action:@selector(showStickHeaderController) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Push to a Stick Header Controller

- (void)showStickHeaderController {
    HWSingleSectionViewController *singleSectionViewController = [HWSingleSectionViewController new];
    singleSectionViewController.shouldStickHeader = YES;

    [self.navigationController pushViewController:singleSectionViewController animated:YES];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataList;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [HWListIntoSingleSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        if (_shouldStickHeader) {
            // This is ONLY used above iOS9.
            // set the UICollectionViewFlowLayout "sectionHeadersPinToVisibleBounds" make collectionView like the TableView style: Plain or Group.
//        layout.sectionHeadersPinToVisibleBounds = YES;
            IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:YES scrollDirection:UICollectionViewScrollDirectionVertical topContentInset:0 stretchToEdge:NO];
            _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        } else {
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        }

        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}

- (NSArray *)dataList {
    if (!_dataList) {
        NSMutableArray *dataSource = [NSMutableArray arrayWithCapacity:2];
        NSMutableArray *list = [NSMutableArray arrayWithCapacity:20];
        for (int i = 0; i < 20; ++i) {
            [list addObject:@(i + 1)];
        }
        
        [dataSource addObject:[list copy]];
        
        [list removeAllObjects];
        
        for (int i = 20; i < 40; ++i) {
            [list addObject:@(i + 1)];
        }
        
        [dataSource addObject:[list copy]];
        
        _dataList = [dataSource copy];
    }
    return _dataList;
}


@end
