//
//  IRAQPhotoPickerController.m
//  IRAQPhotoPickerController
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQPhotoPickerController.h"
#import "IRAQPhotoPickerControllerSubclass.h"
#import "IRAQAlbumListViewController.h"
#import "IRAQPhotoGridViewController.h"
#import "UIViewController+IRAQAdditions.h"

@implementation IRAQPhotoPickerController
@synthesize callback = _callback;
@synthesize assetsLibrary = _assetsLibrary;

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

- (IRAQPhotoPickerController *) initWithCompletion:(IRAQPhotoPickerControllerCallback)callback {

	IRAQAlbumListViewController *controller = [self newAlbumListViewController];
	
	self = [super initWithRootViewController:controller];
	if (!self)
		return nil;
		
	controller.delegate = self;
	_callback = [callback copy];
	
	return self;

}

- (ALAssetsLibrary *) assetsLibrary {

	if (!_assetsLibrary) {
	
		_assetsLibrary = [[ALAssetsLibrary alloc] init];
	
	}
	
	return _assetsLibrary;

}

- (IRAQAlbumListViewController *) newAlbumListViewController {

	ALAssetsLibrary * const library = self.assetsLibrary;
	ALAssetsGroupType const groupType = ALAssetsGroupAll;
	
	IRAQAlbumListViewController *controller = [[IRAQAlbumListViewController alloc] initWithAssetsLibrary:library groupType:groupType];
		
	return controller;

}

- (void) albumListViewController:(IRAQAlbumListViewController *)controller didSelectGroup:(ALAssetsGroup *)group {

	IRAQPhotoGridViewController *gridViewController = [[IRAQPhotoGridViewController alloc] initWithAssetsGroup:group];
	
	if (gridViewController && controller.navigationController) {
		
		[controller.navigationController pushViewController:gridViewController animated:YES];
		
	} else if (self.navigationController) {
		
		[self.navigationController pushViewController:gridViewController animated:YES];
		
	} else {
		
		[NSException raise:NSInternalInconsistencyException format:@"Boo."];
		
	}

}

- (void) albumListViewController:(IRAQAlbumListViewController *)controller didFailEnumeratingAssetGroupsWithError:(NSError *)error {

	[self iraqPerformOnStabilized:^{
		
		if (self.callback)
			self.callback(nil, error);

	}];

}

@end
