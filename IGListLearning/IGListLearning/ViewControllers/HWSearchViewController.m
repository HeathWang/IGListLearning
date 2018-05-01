//
//  HWSearchViewController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSearchViewController.h"
#import "HWLabelSectionController.h"
#import "NSString+HWAdd.h"
#import "HWSearchSectionController.h"

@interface HWSearchViewController () <IGListAdapterDataSource, HWSearchSectionControllerDelegate>

@property (nonatomic, strong) NSArray *words;
@property (nonatomic, copy) NSString *keyword;
@property (nonatomic, copy) NSString *token;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation HWSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _token = @"com.heathwang.search.token";
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
    if ([NSString isEmpty:self.keyword]) {
        NSMutableArray *list = [NSMutableArray array];
        [list addObject:self.token];
        [list addObjectsFromArray:self.words];
        return [list copy];
    } else {
        NSMutableArray *list = [NSMutableArray array];
        [list addObject:self.token];
        NSArray *results = [self.words filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains[cd] %@", self.keyword]];
        [list addObjectsFromArray:results];

        return [list copy];
    }

}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSString class]] && [self.token isEqualToString:(NSString *) object]) {
        HWSearchSectionController *searchSectionController = [HWSearchSectionController new];
        searchSectionController.delegate = self;
        return searchSectionController;
    } else {
        return [HWLabelSectionController new];
    }

}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - HWSearchSectionControllerDelegate

- (void)searchSectionController:(HWSearchSectionController *)searchSectionController didChangeText:(NSString *)text {
    self.keyword = text;
    [self.adapter performUpdatesAnimated:YES completion:^(BOOL finished) {

    }];
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

- (NSArray *)words {
    if (!_words) {
        NSString *para = @"Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth.";

        NSMutableSet<NSString *> *set = [NSMutableSet set];
        NSMutableArray *wordsList = [NSMutableArray array];

        [para enumerateSubstringsInRange:NSMakeRange(0, para.length) options:NSStringEnumerationByWords usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            if (substring) {
                if (![set containsObject:substring]) {
                    [set addObject:substring];
                    [wordsList addObject:substring];
                }
            } else {
                *stop = YES;
            }
        }];

        _words = [wordsList copy];
    }
    return _words;
}


@end
