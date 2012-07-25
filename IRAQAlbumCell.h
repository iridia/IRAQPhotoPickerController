//
//  IRAQAlbumCell.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/25/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface IRAQAlbumCell : UITableViewCell

@property (nonatomic, readwrite, weak) ALAssetsGroup *assetsGroup;

@end
