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
    return [self isEqual:object];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return YES;
}

- (NSUInteger)hash {
    return [super hash];
}


@end
