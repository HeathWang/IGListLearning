//
//  IGCollectionViewCell.h
//  XiBeiYouMianCunIOS
//
//  Created by Heath on 2018/5/7.
//  Copyright © 2018 JHXD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IGCellSeparatorStyle) {
    IGCellSeparatorStyleNone,
    IGCellSeparatorStyleSingleLine
};

@interface IGCollectionViewCell : UICollectionViewCell

#pragma mark - Separator config

@property (nonatomic, assign) IGCellSeparatorStyle separatorStyle;
@property (nonatomic, assign) UIEdgeInsets separatorInset;
@property (nonatomic, copy) UIColor *separatorColor;

@end
