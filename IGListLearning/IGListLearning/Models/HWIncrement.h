//
//  HWIncrement.h
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HWIncrement;


@protocol IncrementListener <NSObject>

- (void)didIncrementAnnouncer:(HWIncrement *)increment value:(NSInteger)value;

@end

@interface HWIncrement : NSObject

- (void)addListener:(id <IncrementListener>)listener;

- (void)increment;
@end
