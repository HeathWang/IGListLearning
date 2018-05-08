//
//  HWMonth.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWMonth.h"

@implementation HWMonth

- (instancetype)initWithName:(NSString *)name days:(NSInteger)days appointments:(NSDictionary *)appointments {
    self = [super init];
    if (self) {
        _name = [name copy];
        _days = days;
        _appointments = [appointments copy];
    }

    return self;
}

+ (instancetype)monthWithName:(NSString *)name days:(NSInteger)days appointments:(NSDictionary *)appointments {
    return [[self alloc] initWithName:name days:days appointments:appointments];
}

#pragma mark - IGListDiffable

- (nonnull id <NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)other {
    return YES;
}


@end

@implementation HWDayViewModel

- (instancetype)initWithDay:(NSInteger)day isToday:(BOOL)isToday selected:(BOOL)selected appointmentCount:(NSInteger)appointmentCount {
    self = [super init];
    if (self) {
        _day = day;
        _isToday = isToday;
        _selected = selected;
        _appointmentCount = appointmentCount;
    }

    return self;
}

+ (instancetype)modelWithDay:(NSInteger)day isToday:(BOOL)isToday seleted:(BOOL)seleted appointmentCount:(NSInteger)appointmentCount {
    return [[self alloc] initWithDay:day isToday:isToday selected:seleted appointmentCount:appointmentCount];
}

#pragma mark - isEqual

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToModel:other];
}

- (BOOL)isEqualToModel:(HWDayViewModel *)model {
    if (self == model)
        return YES;
    if (model == nil)
        return NO;
    if (self.day != model.day)
        return NO;
    if (self.isToday != model.isToday)
        return NO;
    if (self.selected != model.selected)
        return NO;
    if (self.appointmentCount != model.appointmentCount)
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = (NSUInteger) self.day;
    hash = hash * 31u + self.isToday;
    hash = hash * 31u + self.selected;
    hash = hash * 31u + self.appointmentCount;
    return hash;
}

#pragma mark - IGListDiffable

- (nonnull id <NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)object {
    return [self isEqual:object];
}


@end

@implementation HWMonthTitleViewModel


- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
    }

    return self;
}

+ (instancetype)modelWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

#pragma mark - isEqual

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToModel:other];
}

- (BOOL)isEqualToModel:(HWMonthTitleViewModel *)model {

    if (self.name != model.name && ![self.name isEqualToString:model.name])
        return NO;
    return YES;
}

- (NSUInteger)hash {
    return [self.name hash];
}


#pragma mark - IGListDiffable

- (nonnull id <NSObject>)diffIdentifier {
    return self.name;
}

- (BOOL)isEqualToDiffableObject:(nullable id <IGListDiffable>)object {
    return [self isEqual:object];
}


@end
