//
//  IRAQAlbumListViewController.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>

#import "IRAQAlbumListViewControllerDelegate.h"

@interface IRAQAlbumListViewController : UITableViewController

- (id) initWithAssetsLibrary:(ALAssetsLibrary *)library groupType:(ALAssetsGroupType)groupType;

@property (nonatomic, readwrite, weak) id<IRAQAlbumListViewControllerDelegate> delegate;

@end
