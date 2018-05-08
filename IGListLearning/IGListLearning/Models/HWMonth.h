//
//  HWMonth.h
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWMonth : NSObject <IGListDiffable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger days;
@property (nonatomic, copy) NSDictionary *appointments;

- (instancetype)initWithName:(NSString *)name days:(NSInteger)days appointments:(NSDictionary *)appointments NS_DESIGNATED_INITIALIZER;

+ (instancetype)monthWithName:(NSString *)name days:(NSInteger)days appointments:(NSDictionary *)appointments;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end

@interface HWDayViewModel : NSObject  <IGListDiffable>

@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) BOOL isToday;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) NSInteger appointmentCount;


- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithDay:(NSInteger)day isToday:(BOOL)isToday selected:(BOOL)selected appointmentCount:(NSInteger)appointmentCount NS_DESIGNATED_INITIALIZER;

+ (instancetype)modelWithDay:(NSInteger)day isToday:(BOOL)isToday seleted:(BOOL)seleted appointmentCount:(NSInteger)appointmentCount;

- (instancetype)new NS_UNAVAILABLE;


@end

@interface HWMonthTitleViewModel : NSObject  <IGListDiffable>

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

+ (instancetype)modelWithName:(NSString *)name;


@end


