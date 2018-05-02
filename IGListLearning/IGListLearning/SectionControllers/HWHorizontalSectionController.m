//
//  HWHorizontalSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWHorizontalSectionController.h"
#import "HWEmbeddedCell.h"
#import "HWEmbeddedSectionController.h"

@interface HWHorizontalSectionController () <IGListAdapterDataSource>

@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation HWHorizontalSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController];
        _adapter.dataSource = self;
    }

    return self;
}


- (NSInteger)numberOfItems {
    return 1;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWEmbeddedCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWEmbeddedCell.class forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 100);
}

- (void)didUpdateToObject:(id)object {
    self.count = object;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count.integerValue];
    for (int i = 0; i < self.count.integerValue; ++i) {
        [array addObject:@(i + 1)];
    }
    return [array copy];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [HWEmbeddedSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


@end
