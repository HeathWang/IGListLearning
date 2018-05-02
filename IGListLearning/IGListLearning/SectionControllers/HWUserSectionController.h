//
//  HWUserSectionController.h
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "IGListSectionController.h"

@interface HWUserSectionController : IGListSectionController

@property (nonatomic, assign, readonly) BOOL canMove;

- (instancetype)initWithCanMove:(BOOL)canMove NS_DESIGNATED_INITIALIZER;

+ (instancetype)controllerWithCanMove:(BOOL)canMove;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end
