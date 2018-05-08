//
//  HWInjectionSC.h
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "IGListSectionController.h"
#import "HWIncrement.h"

@class HWIncrement;

@interface HWInjectionSC : IGListSectionController <IncrementListener>

@property (nonatomic, strong) HWIncrement *increment;

- (instancetype)initWithIncrement:(HWIncrement *)increment;

+ (instancetype)scWithIncrement:(HWIncrement *)increment;


@end
