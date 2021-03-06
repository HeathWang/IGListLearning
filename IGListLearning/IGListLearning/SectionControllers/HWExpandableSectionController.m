//
//  HWExpandableSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWExpandableSectionController.h"
#import "HWLabelCell.h"

@interface HWExpandableSectionController ()

@property (nonatomic, assign) BOOL isExpanding;
@property (nonatomic, strong) NSString *contentText;

@end

@implementation HWExpandableSectionController


- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, self.isExpanding ? [HWLabelCell cellHeightWithText:self.contentText width:self.collectionContext.containerSize.width] : [HWLabelCell singleCellHeight]);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWLabelCell *labelCell = [self.collectionContext dequeueReusableCellOfClass:HWLabelCell.class forSectionController:self atIndex:index];
    labelCell.content = self.contentText;
    return labelCell;
}

- (void)didUpdateToObject:(id)object {
    self.contentText = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    self.isExpanding = !self.isExpanding;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        // key point
        [self.collectionContext invalidateLayoutForSectionController:self completion:NULL];
    } completion:^(BOOL finished) {
        
    }];
    
}


@end
