//
//  HWUserModel.h
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWUserModel : NSObject

@property (nonatomic, copy, readonly) NSString *uid;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *handle;

- (instancetype)initWithUid:(NSString *)uid username:(NSString *)username handle:(NSString *)handle NS_DESIGNATED_INITIALIZER;

+ (instancetype)modelWithUid:(NSString *)uid username:(NSString *)username handle:(NSString *)handle;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end
