//
//  HWInjectionSC.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWInjectionSC.h"
#import "HWIncrement.h"
#import "HWDemoViewCell.h"

@implementation HWInjectionSC {
    NSNumber *_number;
}

- (instancetype)initWithIncrement:(HWIncrement *)increment {
    self = [super init];
    if (self) {
        _increment = increment;

        [_increment addListener:self];

        _number = @0;
    }

    return self;
}

+ (instancetype)scWithIncrement:(HWIncrement *)increment {
    return [[self alloc] initWithIncrement:increment];
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 48);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWDemoViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:HWDemoViewCell.class forSectionController:self atIndex:index];
    cell.nameText = [NSString stringWithFormat:@"Section: %ld Value: %ld", (long) self.section, [_number longValue]];
    
    return cell;
}

#pragma mark - IncrementListener

- (void)didIncrementAnnouncer:(HWIncrement *)increment value:(NSInteger)value {
    _number = @(value);
    
    HWDemoViewCell *cell = [self.collectionContext cellForItemAtIndex:0 sectionController:self];
    cell.nameText = [NSString stringWithFormat:@"Section: %ld Value: %ld", (long) self.section, [_number longValue]];
}


@end
