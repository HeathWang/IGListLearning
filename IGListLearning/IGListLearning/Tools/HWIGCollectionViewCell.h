//
//  HWIGCollectionViewCell.h
//  XiBeiYouMianCunIOS
//
//  Created by Heath on 2018/5/7.
//  Copyright © 2018 JHXD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit/IGListBindable.h>

typedef NS_ENUM(NSUInteger, IGCellSeparatorStyle) {
    IGCellSeparatorStyleNone,
    IGCellSeparatorStyleSingleLine, // this is default
};

typedef NS_ENUM(NSUInteger, IGCellStyle) {
    IGCellStyleNone, // No textLabel
    IGCellStyleValue1,  // textLabel, Default
};

@interface HWIGCollectionViewCell : UICollectionViewCell <IGListBindable>

#pragma mark - Separator config

@property (nonatomic, assign) IGCellStyle cellStyle;

@property (nonatomic, assign) IGCellSeparatorStyle separatorStyle;
@property (nonatomic, assign) UIEdgeInsets separatorInset;
@property (nonatomic, copy) UIColor *separatorColor;

@property(nonatomic, readonly, strong) UILabel *textLabel;
@property (nonatomic, assign) UIEdgeInsets textLabelInset;

/**
 * subclass can call this method to add, config view, should call super.
 */
- (void)setupViews;
@end
