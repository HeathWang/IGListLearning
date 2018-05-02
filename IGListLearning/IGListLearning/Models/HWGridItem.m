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
    }

    return self;
}

+ (instancetype)itemWithColor:(UIColor *)color count:(NSInteger)count {
    return [[self alloc] initWithColor:color count:count];
}


@end
