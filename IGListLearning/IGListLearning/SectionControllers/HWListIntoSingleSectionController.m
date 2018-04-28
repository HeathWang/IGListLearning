//
//  HWListIntoSingleSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWListIntoSingleSectionController.h"
#import "HWDemoViewCell.h"

@interface HWListIntoSingleSectionController ()

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation HWListIntoSingleSectionController

- (NSInteger)numberOfItems {
    return self.dataList.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 48);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWDemoViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWDemoViewCell.class forSectionController:self atIndex:index];
    NSNumber *number = self.dataList[index];
    cell.nameText = [NSString stringWithFormat:@"%ld", number.integerValue];

    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.dataList = object;
}

@end
