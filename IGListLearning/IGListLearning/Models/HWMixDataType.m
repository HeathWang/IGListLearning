//
//  HWMixDataType.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWMixDataType.h"

@implementation HWMixDataType

- (instancetype)initWithTypeName:(NSString *)typeName referClazz:(Class)referClazz {
    self = [super init];
    if (self) {
        _typeName = typeName;
        _referClazz = referClazz;
    }

    return self;
}

+ (instancetype)typeWithTypeName:(NSString *)typeName referClazz:(Class)referClazz {
    return [[self alloc] initWithTypeName:typeName referClazz:referClazz];
}

@end
