//
//  IRAQPhotoPickerControllerSubclass.h
//  IRAQPhotoPickerController
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQPhotoPickerController.h"
#import "IRAQAlbumListViewControllerDelegate.h"
#import "IRAQPhotoGridViewControllerDelegate.h"

@class ALAssetsLibrary, IRAQAlbumListViewController;
@interface IRAQPhotoPickerController () <IRAQAlbumListViewControllerDelegate, IRAQPhotoGridViewControllerDelegate>

@property (nonatomic, readonly, copy) IRAQPhotoPickerControllerCallback callback;
@property (nonatomic, readonly, copy) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, readonly, copy) NSArray *selectedAssets;

@property (nonatomic, readonly, strong) IBOutlet UIBarButtonItem *doneItem;
@property (nonatomic, readonly, strong) IBOutlet UIBarButtonItem *cancelItem;

- (IBAction) handleDone:(id)sender;
- (IBAction) handleCancel:(id)sender;

- (IRAQAlbumListViewController *) newAlbumListViewController;
- (IRAQPhotoGridViewController *) newPhotoGridViewControllerWithGroup:(ALAssetsGroup *)group;

- (UIBarButtonItem *) newDoneItem;
- (UIBarButtonItem *) newCancelItem;

@end
