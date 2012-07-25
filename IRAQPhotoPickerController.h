//
//  IRAQPhotoPickerController.h
//  IRAQPhotoPickerController
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef void (^IRAQPhotoPickerControllerCallback) (NSArray *selectedAssets, NSError *error);

@interface IRAQPhotoPickerController : UINavigationController

- (IRAQPhotoPickerController *) initWithAssetsLibrary:(ALAssetsLibrary *)library completion:(IRAQPhotoPickerControllerCallback)callback;

@end
