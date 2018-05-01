//
//  HWPullLoadingViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWPullLoadingViewController.h"
#import "HWLabelSectionController.h"
#import "HWSpinnerCell.h"

static NSString *const kSpinnerToken = @"com.heathwang.spinner.token";

@interface HWPullLoadingViewController () <IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, assign) BOOL isLoading;

@end

@implementation HWPullLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    // note: set the scrollViewDelegate to controller.
    self.adapter.scrollViewDelegate = self;

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    /**
     * 加载更多，这里数据源用的是NSNumber，因为IGListKit里对NSString和NSNumber自动实现了IGListDiffable protocol，所以这里我们不用再实现IGListDiffable
     */
    if (self.isLoading) {
        NSMutableArray *objs = [NSMutableArray arrayWithArray:self.list];
        [objs addObject:kSpinnerToken];

        return objs;
    }
    return self.list;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:NSString.class] && [object isEqualToString:kSpinnerToken]) {
        return [HWSpinnerCell spinnerSectionController];
    }
    return [HWLabelSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat distance = scrollView.contentSize.height - (targetContentOffset->y + scrollView.bounds.size.height);
    if (distance < 200 && !self.isLoading) {
        self.isLoading = YES;
        // every time user performUpdatesAnimated method, it will call objectsForListAdapter -> sectionControllerForObject
        [self.adapter performUpdatesAnimated:YES completion:NULL];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            sleep(3);

            dispatch_async(dispatch_get_main_queue(), ^{
                self.isLoading = NO;
                NSInteger count = self.list.count;
                for (int i = count; i < count + 20; ++i) {
                    [self.list addObject:[NSString stringWithFormat:@"%ld", (long) (i + 1)]];
                }

                [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {

                }];

            });
        });
    }
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

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0; i < 20; ++i) {
            [_list addObject:[NSString stringWithFormat:@"%ld", (long) (i + 1)]];
        }
    }
    return _list;
}


@end
