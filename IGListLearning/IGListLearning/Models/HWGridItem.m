//
//  HWGridItem.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWGridItem.h"

@implementation HWGridItem
- (instancetype)initWithColor:(UIColor *)color count:(NSInteger)count {
    self = [super init];
    if (self) {
        _color = color;
        _count = count;

        NSMutableArray *items = [NSMutableArray arrayWithCapacity:count];
        for (int i = 0; i < count; ++i) {
            [items addObject:@(i)];
        }
        _items = [items copy];
    }

    return self;
}

+ (instancetype)itemWithColor:(UIColor *)color count:(NSInteger)count {
    return [[self alloc] initWithColor:color count:count];
}

#pragma mark - IGListDiffable

- (nonnull id <NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)other {
    return [self isEqual:other];
}


@end
