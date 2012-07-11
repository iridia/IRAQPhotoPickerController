//
//  IRAQAlbumListViewControllerDelegate.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IRAQAlbumListViewController, ALAssetsGroup;
@protocol IRAQAlbumListViewControllerDelegate <NSObject>

- (void) albumListViewController:(IRAQAlbumListViewController *)controller didSelectGroup:(ALAssetsGroup *)group;
- (void) albumListViewController:(IRAQAlbumListViewController *)controller didFailEnumeratingAssetGroupsWithError:(NSError *)error;

@end
