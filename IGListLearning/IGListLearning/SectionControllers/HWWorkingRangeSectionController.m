//
//  HWWorkingRangeSectionController.m
//  IGListLearning
//
//  Created by Heath on 2018/5/3.
//  Copyright © 2018 Heath. All rights reserved.
//

#import "HWWorkingRangeSectionController.h"
#import "HWDemoViewCell.h"
#import "HWImageViewCell.h"
#import "NSString+HWAdd.h"

@interface HWWorkingRangeSectionController () <IGListWorkingRangeDelegate>

@property (nonatomic, strong) NSNumber *imageIndex;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong) UIImage *downloadImage;

@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@implementation HWWorkingRangeSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.workingRangeDelegate = self;
    }

    return self;
}

- (NSInteger)numberOfItems {
    return 2;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat height = self.collectionContext.containerSize.width;
    return CGSizeMake(height, index == 0 ? 48 : self.imageIndex.floatValue);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    if (index == 0) {
        HWDemoViewCell *demoCell = [self.collectionContext dequeueReusableCellOfClass:HWDemoViewCell.class forSectionController:self atIndex:index];
        demoCell.nameText = self.urlString;
        return demoCell;
    } else {
        HWImageViewCell *imageCell = [self.collectionContext dequeueReusableCellOfClass:HWImageViewCell.class forSectionController:self atIndex:index];
        [imageCell setDownloadImage:self.downloadImage];

        return imageCell;
    }
}

- (void)didUpdateToObject:(id)object {
    self.imageIndex = object;

    /**
     * WARNING:
     * In this method, we can NOT get "self.collectionContext.containerSize"
     */
    // "https://unsplash.it/" + width.description + "/" + height.description
//    CGFloat width = self.collectionContext.containerSize.width;
//    NSString *url = [NSString stringWithFormat:@"https://unsplash.it/%ld/%ld", (long) width, (long) self.imageIndex.integerValue];
//    self.urlString = url;
}

#pragma mark - IGListWorkingRangeDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerWillEnterWorkingRange:(IGListSectionController *)sectionController {
    if (self.downloadImage == nil && ![NSString isEmpty:self.urlString]) {

        NSLog(@"download image url:%@ at section index: %ld", self.urlString, self.section);

        self.task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:self.urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            UIImage *image = [[UIImage alloc] initWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.downloadImage = image;
                    HWImageViewCell *imageCell = [self.collectionContext cellForItemAtIndex:1 sectionController:self];
                    if (imageCell) {
                        [imageCell setDownloadImage:self.downloadImage];
                    }
                });
            }
        }];

        [self.task resume];
    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerDidExitWorkingRange:(IGListSectionController *)sectionController {

}

- (NSString *)urlString {

    CGFloat width = self.collectionContext.containerSize.width;
    NSString *url = [NSString stringWithFormat:@"https://unsplash.it/%ld/%ld", (long) width, (long) self.imageIndex.integerValue];
    _urlString = [url copy];
    return _urlString;
}

- (void)dealloc {
    [self.task cancel];
}


@end
