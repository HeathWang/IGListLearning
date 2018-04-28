//
//  HWDemoSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/4/28.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWDemoSectionController.h"
#import "HWDemoItem.h"
#import "HWDemoViewCell.h"
#import "HWPullLoadingViewController.h"

@interface HWDemoSectionController ()

@property (nonatomic, strong) HWDemoItem *demoItem;

@end

@implementation HWDemoSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 60);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWDemoViewCell *demoCell = [self.collectionContext dequeueReusableCellOfClass:HWDemoViewCell.class forSectionController:self atIndex:index];
    demoCell.nameText = self.demoItem.demoName;
    return demoCell;
}

- (void)didUpdateToObject:(id)object {
    self.demoItem = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    Class clazz = NSClassFromString(self.demoItem.controllerClass);

    HWPullLoadingViewController *pullLoadingController = (HWPullLoadingViewController *) [[clazz alloc] init];
    [self.viewController.navigationController pushViewController:pullLoadingController animated:YES];
}


@end
