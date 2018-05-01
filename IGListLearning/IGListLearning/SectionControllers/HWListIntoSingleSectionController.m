//
//  HWListIntoSingleSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWListIntoSingleSectionController.h"
#import "HWDemoViewCell.h"
#import "HWSingleListHeaderFooterView.h"

@interface HWListIntoSingleSectionController () <IGListSupplementaryViewSource>

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation HWListIntoSingleSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }

    return self;
}


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

#pragma mark - IGListSupplementaryViewSource

/**
 * Only these two kind can be used:
 * UICollectionElementKindSectionHeader
 * UICollectionElementKindSectionFooter
 *
 */
- (NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionHeader, UICollectionElementKindSectionFooter];
}

/**
 *
 * @return UICollectionReusableView as header or footer
 */
- (__kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    HWSingleListHeaderFooterView *headerFooterView = [self.collectionContext dequeueReusableSupplementaryViewOfKind:elementKind forSectionController:self class:HWSingleListHeaderFooterView.class atIndex:index];
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        headerFooterView.info = @"Welcome, I'm the section header.";
        headerFooterView.backgroundColor = [UIColor blueColor];
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        headerFooterView.info = @"At last, you found me.";
        headerFooterView.backgroundColor = [UIColor purpleColor];
    }
    return headerFooterView;


}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 60);
}


@end
