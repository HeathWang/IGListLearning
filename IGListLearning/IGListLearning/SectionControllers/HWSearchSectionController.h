//
//  HWSearchSectionController.h
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "IGListSectionController.h"

@class HWSearchSectionController;

@protocol HWSearchSectionControllerDelegate <NSObject>

- (void)searchSectionController:(HWSearchSectionController *)searchSectionController didChangeText:(NSString *)text;

@end

@interface HWSearchSectionController : IGListSectionController

@property (nonatomic, weak) id<HWSearchSectionControllerDelegate> delegate;

@end
