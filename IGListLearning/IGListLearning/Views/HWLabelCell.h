//
//  HWLabelCell.h
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWLabelCell : UICollectionViewCell

@property (nonatomic, copy) NSString *content;

+ (CGFloat)singleCellHeight;

+ (CGFloat)cellHeightWithText:(NSString *)text width:(CGFloat)width;
@end
