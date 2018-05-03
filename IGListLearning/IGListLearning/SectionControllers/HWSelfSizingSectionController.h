//
//  HWSelfSizingSectionController.h
//  IGListLearning
//
//  Created by heath wang on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "IGListSectionController.h"

typedef NS_ENUM(NSUInteger, HWSelfSizingType) {
    HWSelfSizingTypeFit,
    HWSelfSizingTypeFullWidth,
};

@interface HWSelfSizingSectionController : IGListSectionController

@end

@interface HWSectionModel : NSObject  <IGListDiffable>

@property (nonatomic, copy) NSArray<NSString *> *items;
@property (nonatomic, assign) HWSelfSizingType sizingType;

- (instancetype)initWithItems:(NSArray<NSString *> *)items sizingType:(HWSelfSizingType)sizingType;

+ (instancetype)modelWithItems:(NSArray<NSString *> *)items sizingType:(HWSelfSizingType)sizingType;


@end
