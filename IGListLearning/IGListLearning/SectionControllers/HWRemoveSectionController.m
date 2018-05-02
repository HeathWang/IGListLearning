//
//  HWRemoveSectionController.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWRemoveSectionController.h"
#import "HWRemoveCell.h"

@interface HWRemoveSectionController ()

@property (nonatomic, strong) NSNumber *index;

@end

@implementation HWRemoveSectionController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(12, 0, 0, 0);
    }

    return self;
}


- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 50);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWRemoveCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWRemoveCell.class forSectionController:self atIndex:index];
    cell.index = self.index.stringValue;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.index = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sectionControllerWantsRemoved:)]) {
        [self.delegate sectionControllerWantsRemoved:self];
    }
}

@end
