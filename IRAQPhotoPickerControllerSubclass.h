//
//  IRAQPhotoPickerControllerSubclass.h
//  IRAQPhotoPickerController
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQPhotoPickerController.h"
#import "IRAQAlbumListViewControllerDelegate.h"

@class ALAssetsLibrary, IRAQAlbumListViewController;
@interface IRAQPhotoPickerController () <IRAQAlbumListViewControllerDelegate>

@property (nonatomic, readonly, copy) IRAQPhotoPickerControllerCallback callback;
@property (nonatomic, readonly, copy) ALAssetsLibrary *assetsLibrary;

- (IRAQAlbumListViewController *) newAlbumListViewController;

@end
