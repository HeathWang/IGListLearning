//
//  HWSelfSizingSectionController.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSelfSizingSectionController.h"
#import "HWFitSizeCell.h"
#import "HWFullWidthCell.h"

@interface HWSelfSizingSectionController ()

@property (nonatomic, strong) HWSectionModel *sectionModel;

@end

@implementation HWSelfSizingSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 44, 0);
        self.minimumLineSpacing = 4;
        self.minimumInteritemSpacing = 4;
    }

    return self;
}


- (NSInteger)numberOfItems {
    return self.sectionModel.items.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    if (self.sectionModel.sizingType == HWSelfSizingTypeFit) {
        HWFitSizeCell *fitSizeCell = [self.collectionContext dequeueReusableCellOfClass:HWFitSizeCell.class forSectionController:self atIndex:index];
        fitSizeCell.textString = self.sectionModel.items[index];
        return fitSizeCell;
    } else {
        HWFullWidthCell *fullCell = [self.collectionContext dequeueReusableCellOfClass:HWFullWidthCell.class forSectionController:self atIndex:index];
        fullCell.textString = self.sectionModel.items[index];
        
        return fullCell;
    }
}

- (void)didUpdateToObject:(id)object {
    self.sectionModel = object;
}


@end

@implementation HWSectionModel

#pragma mark - isEqual

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToModel:other];
}

- (BOOL)isEqualToModel:(HWSectionModel *)model {
    if (self == model)
        return YES;
    if (model == nil)
        return NO;
    if (self.items != model.items && ![self.items isEqualToArray:model.items])
        return NO;
    if (self.sizingType != model.sizingType)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.items hash];
    hash = hash * 31u + (NSUInteger) self.sizingType;
    return hash;
}

#pragma mark - init

- (instancetype)initWithItems:(NSArray<NSString *> *)items sizingType:(HWSelfSizingType)sizingType {
    self = [super init];
    if (self) {
        self.items = items;
        self.sizingType = sizingType;
    }

    return self;
}

+ (instancetype)modelWithItems:(NSArray<NSString *> *)items sizingType:(HWSelfSizingType)sizingType {
    return [[self alloc] initWithItems:items sizingType:sizingType];
}

#pragma mark - IGListDiffable

- (nonnull id <NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)other {
    return [self isEqual:other];
}


@end
