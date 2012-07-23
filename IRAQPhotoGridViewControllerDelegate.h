//
//  IRAQPhotoGridViewControllerDelegate.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IRAQPhotoGridViewController, ALAssetsGroup;
@protocol IRAQPhotoGridViewControllerDelegate <NSObject>

- (void) photoGridViewController:(IRAQPhotoGridViewController *)controller didUpdateSelection:(NSArray *)selectedAssets;

@end
