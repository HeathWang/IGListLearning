//
//  NSArray+HW_IGListDiffable.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "NSArray+HW_IGListDiffable.h"

@implementation NSArray (HW_IGListDiffable)

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if ([object isKindOfClass:NSArray.class]) {
        NSArray *arrObj = object;
        return [self isEqualToArray:arrObj];
    } else {
        return NO;
    }
}

@end
