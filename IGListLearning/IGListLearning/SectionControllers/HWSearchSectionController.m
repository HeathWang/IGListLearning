//
//  HWSearchSectionController.m
//  IGListLearning
//
//  Created by heath wang on 2018/5/1.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWSearchSectionController.h"
#import "HWSearchCell.h"

@interface HWSearchSectionController () <UISearchBarDelegate, IGListScrollDelegate>
@end

@implementation HWSearchSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDelegate = self;
    }

    return self;
}


- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 44);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    HWSearchCell *searchCell = [self.collectionContext dequeueReusableCellOfClass:HWSearchCell.class forSectionController:self atIndex:index];
    searchCell.searchBar.delegate = self;
    return searchCell;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchSectionController:didChangeText:)]) {
        [self.delegate searchSectionController:self didChangeText:searchBar.text];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchSectionController:didChangeText:)]) {
        [self.delegate searchSectionController:self didChangeText:searchBar.text];
    }
}

#pragma mark - IGListScrollDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willBeginDraggingSectionController:(IGListSectionController *)sectionController {
    HWSearchCell *searchCell = [self.collectionContext cellForItemAtIndex:0 sectionController:self];
    if (searchCell) {
        [searchCell.searchBar resignFirstResponder];
    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter didScrollSectionController:(IGListSectionController *)sectionController {

}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDraggingSectionController:(IGListSectionController *)sectionController willDecelerate:(BOOL)decelerate {

}


@end
