//
//  HWDisplayDelegateSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/5.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWDisplayDelegateSectionController.h"
#import "HWDemoViewCell.h"

@interface HWDisplayDelegateSectionController ()

@property (nonatomic, strong) NSNumber *itemCount;

@end

@implementation HWDisplayDelegateSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 44, 0);
    }

    return self;
}

- (NSInteger)numberOfItems {
    return 4;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWDemoViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWDemoViewCell.class forSectionController:self atIndex:index];
    cell.nameText = [NSString stringWithFormat:@"Section %ld    Cell %ld", self.section, index];
    
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 48);
}

- (void)didUpdateToObject:(id)object {
    self.itemCount = object;
}


@end
