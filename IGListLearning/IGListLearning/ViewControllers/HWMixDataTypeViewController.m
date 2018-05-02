//
//  HWMixDataTypeViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWMixDataTypeViewController.h"
#import "HWMixDataType.h"
#import "HWGridItem.h"
#import "HWUserModel.h"
#import "HWExpandableSectionController.h"
#import "HWGrimSectionController.h"
#import "HWUserSectionController.h"

@interface HWMixDataTypeViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) NSArray<HWMixDataType *> *typeItems;
@property (nonatomic, assign) Class selectedClass;
@property (nonatomic, strong) NSArray *mixedData;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

@implementation HWMixDataTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;

    self.navigationItem.titleView = self.segmentedControl;
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
    if (self.selectedClass != nil) {
        return [self filterDataWithType:self.selectedClass];
    }

    return self.mixedData;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:NSString.class]) {
        return [HWExpandableSectionController new];
    } else if ([object isKindOfClass:HWGridItem.class]) {
        return [HWGrimSectionController new];
    }
    return [HWUserSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - segmentControl event

- (void)segmentControlChanged:(UISegmentedControl *)sender {
    HWMixDataType *dataType = self.typeItems[sender.selectedSegmentIndex];
    self.selectedClass = dataType.referClazz;
    [self.adapter performUpdatesAnimated:YES completion:NULL];
}

- (NSArray *)filterDataWithType:(Class)clazz {
    NSMutableArray *items = [NSMutableArray array];
    [self.mixedData enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:clazz]) {
            [items addObject:obj];
        }
    }];

    return [items copy];
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
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    return _adapter;
}

- (NSArray<HWMixDataType *> *)typeItems {
    if (!_typeItems) {
        NSMutableArray *list = [NSMutableArray arrayWithCapacity:4];
        [list addObject:[HWMixDataType typeWithTypeName:@"All" referClazz:nil]];
        [list addObject:[HWMixDataType typeWithTypeName:@"Colors" referClazz:HWGridItem.class]];
        [list addObject:[HWMixDataType typeWithTypeName:@"Users" referClazz:HWUserModel.class]];
        [list addObject:[HWMixDataType typeWithTypeName:@"Strings" referClazz:NSString.class]];

        _typeItems = [list copy];
    }
    return _typeItems;
}

- (UISegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:[self.typeItems valueForKey:@"typeName"]];
        _segmentedControl.selectedSegmentIndex = 0;

        [_segmentedControl addTarget:self action:@selector(segmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (NSArray *)mixedData {
    if (!_mixedData) {
        _mixedData = @[[HWGridItem itemWithColor:[UIColor colorWithRed:1.000 green:0.578 blue:0.000 alpha:1.00] count:5],
                [HWUserModel modelWithUid:[NSUUID UUID].UUIDString username:@"Heath Wang" handle:@"good_practice"],
                @"Great article on my bro @stevecronin . His channel as well as mine were both dropped within days of each other. After we had both deleted and privatized a high number of our videos waiting for clarification.",
                @"Matt Pharr's recent blog posts about ispc and how it came to be are a really great read, particularly if you struggle with getting your ideas heard and changing the world",
                [HWGridItem itemWithColor:[UIColor colorWithRed:0.451 green:0.988 blue:0.838 alpha:1.00] count:12],
                [HWUserModel modelWithUid:[NSUUID UUID].UUIDString username:@"Jack Steve" handle:@"AnotherPerson."],
                [HWGridItem itemWithColor:[UIColor colorWithRed:1.000 green:0.186 blue:0.573 alpha:1.00] count:10],
                @"People with Opinions(TM) hate this, but I approach code review as \"approve unless there's an obvious issue\" rather than \"reject unless there's 100% conformity\".",
                [HWUserModel modelWithUid:[NSUUID UUID].UUIDString username:@"Tim" handle:@"iOS_Device."]];
    }
    return _mixedData;
}


@end
