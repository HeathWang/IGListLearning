//
//  HWMixDataType.h
//  IGListLearning
//
//  Created by Heath on 2018/5/2.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWMixDataType : NSObject

@property (nonatomic, copy,readonly) NSString *typeName;
@property (nonatomic, assign, readonly) Class referClazz;

- (instancetype)initWithTypeName:(NSString *)typeName referClazz:(Class)referClazz NS_DESIGNATED_INITIALIZER;

+ (instancetype)typeWithTypeName:(NSString *)typeName referClazz:(Class)referClazz;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;


@end
