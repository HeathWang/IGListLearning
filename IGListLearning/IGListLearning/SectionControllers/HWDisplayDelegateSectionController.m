//
//  HWDisplayDelegateSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/5.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWDisplayDelegateSectionController.h"
#import "HWDemoViewCell.h"

@interface HWDisplayDelegateSectionController () <IGListDisplayDelegate>

@property (nonatomic, strong) NSNumber *itemCount;

@end

@implementation HWDisplayDelegateSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 44, 0);
        self.displayDelegate = self;
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

#pragma mark - IGListDisplayDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController {
    NSLog(@"%s section index: %ld", __PRETTY_FUNCTION__, (long) sectionController.section);
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController {
    NSLog(@"%s section index: %ld", __PRETTY_FUNCTION__, (long) sectionController.section);
}

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController cell:(UICollectionViewCell *)cell atIndex:(NSInteger)index {
    NSLog(@"%s section index: %ld cell index:%ld", __PRETTY_FUNCTION__, (long) sectionController.section, (long) index);
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController cell:(UICollectionViewCell *)cell atIndex:(NSInteger)index {
    NSLog(@"%s section index: %ld cell index:%ld", __PRETTY_FUNCTION__, (long) sectionController.section, (long) index);
}


@end
