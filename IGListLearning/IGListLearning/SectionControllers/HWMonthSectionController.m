//
//  HWMonthSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/8.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWMonthSectionController.h"
#import "HWMonth.h"
#import "HWCalendarDayCell.h"
#import "HWMonthTitleCell.h"
#import "HWDemoViewCell.h"

@interface HWMonthSectionController () <IGListBindingSectionControllerDataSource, IGListBindingSectionControllerSelectionDelegate>

@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation HWMonthSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        _selectedIndex = -1;
        self.selectionDelegate = self;
        self.dataSource = self;
    }

    return self;
}

#pragma mark - IGListBindingSectionControllerDataSource

- (NSArray<id <IGListDiffable>> *)sectionController:(IGListBindingSectionController *)sectionController viewModelsForObject:(id)object {
    if ([object isKindOfClass:HWMonth.class]) {
        HWMonth *month = object;

        NSDate *date = [NSDate date];
        NSInteger today = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:date];

        NSMutableArray<id <IGListDiffable>> *viewModels = [NSMutableArray array];
        [viewModels addObject:[[HWMonthTitleViewModel alloc] initWithName:month.name]];

        for (int i = 1; i < month.days + 1; ++i) {
            NSArray *list = month.appointments[@(i)];
            HWDayViewModel *dayViewModel = [[HWDayViewModel alloc] initWithDay:i isToday:i == today selected:i == _selectedIndex appointmentCount:list.count];
            [viewModels addObject:dayViewModel];
        }

        NSArray *items = month.appointments[@(self.selectedIndex)];
        for (NSString *string in items) {
            [viewModels addObject:string];
        }

        return viewModels;

    } else {
        return @[];
    }

}

- (UICollectionViewCell <IGListBindable> *)sectionController:(IGListBindingSectionController *)sectionController cellForViewModel:(id)viewModel atIndex:(NSInteger)index {
    Class aClass;
    if ([viewModel isKindOfClass:HWDayViewModel.class]) {
        aClass = HWCalendarDayCell.class;
    } else if ([viewModel isKindOfClass:HWMonthTitleViewModel.class]) {
        aClass = HWMonthTitleCell.class;
    } else if ([viewModel isKindOfClass:NSString.class]) {
        aClass = HWDemoViewCell.class;
    }
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:aClass forSectionController:self atIndex:index];

    if ([viewModel isKindOfClass:HWMonthTitleViewModel.class]) {
        HWMonthTitleCell *monthTitleCell = (HWMonthTitleCell *) cell;
        monthTitleCell.cellStyle = IGCellStyleValue1;
    }

    return cell;
}

- (CGSize)sectionController:(IGListBindingSectionController *)sectionController sizeForViewModel:(id)viewModel atIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    if ([viewModel isKindOfClass:HWDayViewModel.class]) {
        CGFloat square = width / 7;
        return CGSizeMake(square, square);
    } else if ([viewModel isKindOfClass:HWMonthTitleViewModel.class]) {
        return CGSizeMake(width, 44);
    } else {
        return CGSizeMake(width, 55);
    }
}

#pragma mark - IGListBindingSectionControllerSelectionDelegate


- (void)sectionController:(IGListBindingSectionController *)sectionController didSelectItemAtIndex:(NSInteger)index viewModel:(id)viewModel {
    if ([viewModel isKindOfClass:HWDayViewModel.class]) {
        HWDayViewModel *dayViewModel = viewModel;
        if (dayViewModel.day == self.selectedIndex) {
            self.selectedIndex = -1;
        } else {
            self.selectedIndex = dayViewModel.day;
        }

        [self updateAnimated:YES completion:NULL];
    }
}

//- (void)sectionController:(IGListBindingSectionController *)sectionController didDeselectItemAtIndex:(NSInteger)index viewModel:(id)viewModel {
//
//}
//
//- (void)sectionController:(IGListBindingSectionController *)sectionController didHighlightItemAtIndex:(NSInteger)index viewModel:(id)viewModel {
//
//}
//
//- (void)sectionController:(IGListBindingSectionController *)sectionController didUnhighlightItemAtIndex:(NSInteger)index viewModel:(id)viewModel {
//
//}


@end
