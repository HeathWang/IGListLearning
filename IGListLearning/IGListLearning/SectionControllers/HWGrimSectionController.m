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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing = 1;
    }

    return self;
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
    return grimCell;
}

- (void)didUpdateToObject:(id)object {
    self.gridItem = object;
}

@end
