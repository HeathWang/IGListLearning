//
//  HWDemoItem.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWDemoItem.h"

@implementation HWDemoItem

- (instancetype)initWithDemoName:(NSString *)demoName controllerClass:(NSString *)controllerClass {
    self = [super init];
    if (self) {
        _demoName = [demoName copy];
        _controllerClass = [controllerClass copy];
    }

    return self;
}

+ (instancetype)itemWithDemoName:(NSString *)demoName controllerClass:(NSString *)controllerClass {
    return [[self alloc] initWithDemoName:demoName controllerClass:controllerClass];
}

#pragma mark - IGListDiffable

- (nonnull id <NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)other {
    return self == other;
}


@end
