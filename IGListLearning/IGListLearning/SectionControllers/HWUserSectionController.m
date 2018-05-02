//
//  HWUserSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWUserSectionController.h"
#import "HWUserModel.h"
#import "HWUserCell.h"

@interface HWUserSectionController ()

@property (nonatomic, strong) HWUserModel *user;

@end

@implementation HWUserSectionController

#pragma mark - init

- (instancetype)initWithCanMove:(BOOL)canMove {
    self = [super init];
    if (self) {
        _canMove = canMove;

        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing = 1;
    }

    return self;
}

+ (instancetype)controllerWithCanMove:(BOOL)canMove {
    return [[self alloc] initWithCanMove:canMove];
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 44);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWUserCell *userCell = [self.collectionContext dequeueReusableCellOfClass:HWUserCell.class forSectionController:self atIndex:index];
    [userCell setUser:self.user.username refer:self.user.handle];
    
    return userCell;
}

- (void)didUpdateToObject:(id)object {
    self.user = object;
}

- (BOOL)canMoveItemAtIndex:(NSInteger)index {
    return self.canMove;
}

// because the section controller ONLY has ONE object, so we do NOT need handle data when move cell.
//- (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
//
//}

@end
