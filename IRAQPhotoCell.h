//
//  IRAQPhotoCell.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "AQGridViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>

@interface IRAQPhotoCell : AQGridViewCell

@property (nonatomic, readwrite, weak) ALAsset *asset;
@property (nonatomic, readonly, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, readonly, weak) IBOutlet UIView *selectionOverlay;

@end
