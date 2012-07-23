//
//  IRAQPhotoGridViewController.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "IRAQPhotoGridViewControllerDelegate.h"


@class AQGridView;
@interface IRAQPhotoGridViewController : UIViewController

- (id) initWithAssetsGroup:(ALAssetsGroup *)group;

@property (nonatomic, readwrite, weak) id<IRAQPhotoGridViewControllerDelegate> delegate;
@property (nonatomic, retain) AQGridView *gridView;

@end
