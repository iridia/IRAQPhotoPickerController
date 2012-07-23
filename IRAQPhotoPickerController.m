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
@synthesize selectedAssets = _selectedAssets;
@synthesize doneItem = _doneItem;
@synthesize cancelItem = _cancelItem;

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

- (IRAQPhotoPickerController *) initWithCompletion:(IRAQPhotoPickerControllerCallback)callback {

	IRAQAlbumListViewController *controller = [self newAlbumListViewController];
	
	self = [self initWithRootViewController:controller];
	if (!self)
		return nil;
	
	_callback = [callback copy];
	
	return self;

}

- (ALAssetsLibrary *) assetsLibrary {

	if (!_assetsLibrary) {
	
		_assetsLibrary = [[ALAssetsLibrary alloc] init];
	
	}
	
	return _assetsLibrary;

}

- (void) albumListViewController:(IRAQAlbumListViewController *)controller didSelectGroup:(ALAssetsGroup *)group {
	
	IRAQPhotoGridViewController *pgVC = [self newPhotoGridViewControllerWithGroup:group];
	
	if (pgVC && controller.navigationController) {
		
		[controller.navigationController pushViewController:pgVC animated:YES];
		
	} else if (self.navigationController) {
		
		[self.navigationController pushViewController:pgVC animated:YES];
		
	} else {
		
		[NSException raise:NSInternalInconsistencyException format:@"Boo."];
		
	}

}

- (void) photoGridViewController:(IRAQPhotoGridViewController *)controller didUpdateSelection:(NSArray *)selectedAssets {

	[self willChangeValueForKey:@"selectedAssets"];
	
	_selectedAssets = selectedAssets;
	
	self.doneItem.enabled = (BOOL)!![_selectedAssets count];
	
	[self didChangeValueForKey:@"selectedAssets"];

}

- (void) albumListViewController:(IRAQAlbumListViewController *)controller didFailEnumeratingAssetGroupsWithError:(NSError *)error {

	[self iraqPerformOnStabilized:^{
		
		if (self.callback)
			self.callback(nil, error);

	}];

}

- (UIBarButtonItem *) doneItem {

	if (!_doneItem) {
	
		UIBarButtonItem *doneItem = [self newDoneItem];
		_doneItem = doneItem;
	
	}
	
	return _doneItem;

}

- (UIBarButtonItem *) cancelItem {

	if (!_cancelItem) {
	
		UIBarButtonItem *cancelItem = [self newCancelItem];
		_cancelItem = cancelItem;
	
	}
	
	return _cancelItem;

}

- (void) handleDone:(id)sender {

	[self iraqPerformOnStabilized:^{
	
		if (self.callback)
			self.callback(self.selectedAssets, nil);
		
	}];

}

- (void) handleCancel:(id)sender {

	[self iraqPerformOnStabilized:^{
	
		if (self.callback)
			self.callback(nil, nil);
		
	}];

}

- (IRAQAlbumListViewController *) newAlbumListViewController {

	ALAssetsLibrary * const library = self.assetsLibrary;
	ALAssetsGroupType const groupType = ALAssetsGroupAll;
	
	IRAQAlbumListViewController *controller = [[IRAQAlbumListViewController alloc] initWithAssetsLibrary:library groupType:groupType];
	controller.delegate = self;
	controller.navigationItem.leftBarButtonItem = self.cancelItem;
	
	return controller;

}

- (IRAQPhotoGridViewController *) newPhotoGridViewControllerWithGroup:(ALAssetsGroup *)group {

	IRAQPhotoGridViewController *controller = [[IRAQPhotoGridViewController alloc] initWithAssetsGroup:group];
	controller.delegate = self;
	controller.navigationItem.rightBarButtonItem = self.doneItem;
	
	return controller;

}

- (UIBarButtonItem *) newDoneItem {

	UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDone:)];
	
	return doneItem;

}

- (UIBarButtonItem *) newCancelItem {

	UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancel:)];
	
	return cancelItem;

}

@end
