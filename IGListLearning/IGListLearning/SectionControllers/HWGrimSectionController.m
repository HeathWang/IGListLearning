//
//  HWGrimSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWGrimSectionController.h"
#import "HWGridItem.h"
#import "HWGrimCell.h"

@interface HWGrimSectionController ()

@property (nonatomic, strong) HWGridItem *gridItem;

@end

@implementation HWGrimSectionController

- (instancetype)initWithCanMove:(BOOL)canMove {
    self = [super init];
    if (self) {
        _canMove = canMove;
        
        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing = 1;
    }

    return self;
}

+ (instancetype)controllerWithCanMove:(BOOL)canMove {
    return [[self alloc] initWithCanMove:canMove];
}

- (NSInteger)numberOfItems {
    return self.gridItem.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemWidth = floor(width / 4);
    return CGSizeMake(itemWidth, itemWidth);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWGrimCell *grimCell = [self.collectionContext dequeueReusableCellOfClass:HWGrimCell.class forSectionController:self atIndex:index];
    grimCell.backgroundColor = self.gridItem.color;
    NSNumber *number = self.gridItem.items[index];
    grimCell.indexLabel.text = number.stringValue;

    return grimCell;
}

- (void)didUpdateToObject:(id)object {
    self.gridItem = object;
}

#pragma mark - handle move action

- (BOOL)canMoveItemAtIndex:(NSInteger)index {
    return self.canMove;
}

- (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
    NSMutableArray *items = [NSMutableArray arrayWithArray:self.gridItem.items];
    id sourceItem = items[sourceIndex];
    id destinationItem = items[destinationIndex];
    items[(NSUInteger) destinationIndex] = sourceItem;
    items[sourceIndex] = destinationItem;
    self.gridItem.items = [items copy];
}

@end
