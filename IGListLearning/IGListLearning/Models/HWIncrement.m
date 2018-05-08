//
//  HWIncrement.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWIncrement.h"

@interface HWIncrement ()

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) NSHashTable<id <IncrementListener>> *map;

@end

@implementation HWIncrement

- (instancetype)init {
    self = [super init];
    if (self) {
        _map = [NSHashTable weakObjectsHashTable];
    }

    return self;
}


- (void)addListener:(id <IncrementListener>)listener {
    [self.map addObject:listener];
}

- (void)increment {
    self.value ++;

    for (id <IncrementListener> listener in self.map) {
        [listener didIncrementAnnouncer:self value:self.value];
    }
}

@end
