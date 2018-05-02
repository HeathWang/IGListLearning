//
//  HWRemoveSectionController.h
//  IGListLearning
//
//  Created by heath wang on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "IGListSectionController.h"

@class HWRemoveSectionController;

@protocol HWRemoveSectionControllerDelegate <NSObject>

- (void)sectionControllerWantsRemoved:(HWRemoveSectionController *)removeSectionController;

@end

@interface HWRemoveSectionController : IGListSectionController

@property (nonatomic, weak) id<HWRemoveSectionControllerDelegate> delegate;

@end
