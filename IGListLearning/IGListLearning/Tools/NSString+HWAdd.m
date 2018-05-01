//
//  NSString+HWAdd.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "NSString+HWAdd.h"

@implementation NSString (HWAdd)

+ (BOOL)isEmpty:(NSString *)string {

    if (string == nil || string == NULL) {
        return YES;
    }

    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }

    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }

    if ([string isEqualToString:@""]) {
        return YES;
    }

    return NO;
}

@end
