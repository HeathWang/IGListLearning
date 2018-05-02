//
//  HWGridItem.h
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWGridItem : NSObject <IGListDiffable>

@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, assign, readonly) NSInteger count;
@property (nonatomic, strong) NSArray *items;

- (instancetype)initWithColor:(UIColor *)color count:(NSInteger)count NS_DESIGNATED_INITIALIZER;

+ (instancetype)itemWithColor:(UIColor *)color count:(NSInteger)count;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end
