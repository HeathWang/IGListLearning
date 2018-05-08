//
//  HWCalendarViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWCalendarViewController.h"
#import "HWMonth.h"
#import "HWMonthSectionController.h"

@interface HWCalendarViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSArray<HWMonth *> *months;

@end

@implementation HWCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Calendar";

    NSDate *date = [NSDate date];
    NSInteger month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:date];
    NSString *monthName = [[NSDateFormatter new] monthSymbols][month - 1];
    HWMonth *month1 = [[HWMonth alloc] initWithName:monthName days:30 appointments:@{
            @2: @[@"Hair"],
            @4: @[@"Nails"],
            @8: @[@"Doctor appt", @"Pick up groceries"],
            @12: @[@"Call back the cable company", @"Find a babysitter"],
            @13: @[@"Dinner at The Smith"],
            @17: @[@"Buy running shoes", @"Buy a fitbit", @"Start running"],
            @20: @[@"write code", @"Learning IGListKit"],
            @27: @[@"Go to School", @"Go Home"]
    }];

    self.months = @[month1];

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

#pragma mark - IGListAdapter DataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.months;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [HWMonthSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return [super emptyViewForListAdapter:listAdapter];
}


#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:0];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
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
