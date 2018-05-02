//
//  HWUserModel.m
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWUserModel.h"

@implementation HWUserModel

- (instancetype)initWithUid:(NSString *)uid username:(NSString *)username handle:(NSString *)handle {
    self = [super init];
    if (self) {
        _uid = [uid copy];
        _username = [username copy];
        _handle = [handle copy];
    }

    return self;
}

+ (instancetype)modelWithUid:(NSString *)uid username:(NSString *)username handle:(NSString *)handle {
    return [[self alloc] initWithUid:uid username:username handle:handle];
}


@end
