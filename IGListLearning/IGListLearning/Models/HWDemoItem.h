//
//  HWDemoItem.h
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>

@interface HWDemoItem : NSObject <IGListDiffable>

@property (nonatomic, strong, readonly) NSString *demoName;
@property (nonatomic, strong, readonly) NSString * controllerClass;

- (instancetype)initWithDemoName:(NSString *)demoName controllerClass:(NSString *)controllerClass NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
