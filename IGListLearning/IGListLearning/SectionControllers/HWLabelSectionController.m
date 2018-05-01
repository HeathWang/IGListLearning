//
//  HWLabelSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWLabelSectionController.h"
#import "HWDemoViewCell.h"

@interface HWLabelSectionController ()

@property (nonatomic, strong) NSString *contentText;

@end

@implementation HWLabelSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 50);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWDemoViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWDemoViewCell.class forSectionController:self atIndex:index];
    cell.nameText = self.contentText;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.contentText = object;
}


@end
