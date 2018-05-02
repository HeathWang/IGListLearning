//
//  HWEmbeddedSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWEmbeddedSectionController.h"
#import "HWGrimCell.h"

@interface HWEmbeddedSectionController ()

@property (nonatomic, strong) NSNumber *number;

@end

@implementation HWEmbeddedSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 10, 0, 10);
    }

    return self;
}


- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat height = self.collectionContext.containerSize.height;
    return CGSizeMake(height, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWGrimCell *grimCell = [self.collectionContext dequeueReusableCellOfClass:HWGrimCell.class forSectionController:self atIndex:index];
    grimCell.backgroundColor = [UIColor colorWithRed:1.000 green:0.149 blue:0.000 alpha:1.00];

    grimCell.indexLabel.text = self.number.stringValue;
    return grimCell;
}

- (void)didUpdateToObject:(id)object {
    self.number = object;
}

@end
