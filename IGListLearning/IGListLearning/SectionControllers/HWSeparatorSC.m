//
//  HWSeparatorSC.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSeparatorSC.h"
#import "HWIGCollectionViewCell.h"

@implementation HWSeparatorSC {
    NSNumber *_itemCount;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(44, 0, 0, 0);
    }

    return self;
}


- (NSInteger)numberOfItems {
    return _itemCount.integerValue;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 48);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWIGCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWIGCollectionViewCell.class forSectionController:self atIndex:index];
    cell.textLabel.text = [NSString stringWithFormat:@"Section %ld index %ld", (long) self.section, (long) index];
    cell.cellStyle = IGCellStyleValue1;
    if (index % 2 == 0) {
        cell.separatorStyle = IGCellSeparatorStyleNone;
        cell.textLabelInset = UIEdgeInsetsMake(4, 14, 4, 14);
    } else {
        cell.separatorStyle = IGCellSeparatorStyleSingleLine;
        cell.textLabelInset = UIEdgeInsetsMake(4, 28, 4, 14);
        
    }
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _itemCount = object;
}

@end
