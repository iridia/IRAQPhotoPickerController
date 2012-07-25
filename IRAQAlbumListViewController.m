//
//  IRAQAlbumListViewController.m
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/11/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQAlbumListViewController.h"
#import "IRAQAlbumCell.h"


@interface IRAQAlbumListViewController ()

@property (nonatomic, readonly, strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic, readonly, assign) ALAssetsGroupType assetsGroupType;
@property (nonatomic, readonly, strong) NSArray *assetGroups;
- (void) reloadAssets;

@end


@implementation IRAQAlbumListViewController
@synthesize assetsLibrary = _assetsLibrary;
@synthesize assetsGroupType = _assetsGroupType;
@synthesize assetGroups = _assetGroups;

- (id) initWithAssetsLibrary:(ALAssetsLibrary *)library groupType:(ALAssetsGroupType)groupType {

	self = [super initWithNibName:nil bundle:nil];
	if (!self)
		return nil;
	
	_assetsLibrary = library;
	_assetsGroupType = groupType;
	
	self.title = @"Photos";	//	Localisation override point
	
	return self;
	
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	NSCParameterAssert(!nibNameOrNil);
	NSCParameterAssert(!nibBundleOrNil);
	
	return [self initWithAssetsLibrary:nil groupType:ALAssetsGroupAll];

}

- (void) viewDidLoad {
	
	[super viewDidLoad];

	self.clearsSelectionOnViewWillAppear = YES;
	self.tableView.rowHeight = 56.0f;

}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

- (NSArray *) assetGroups {

	if (!_assetGroups)
		[self reloadAssets];
	
	return _assetGroups;

}

- (void) reloadAssets {

	NSMutableArray *newAssets = [NSMutableArray array];
	
	[self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
	
		if (group)
			[newAssets addObject:group];
		
		[self willChangeValueForKey:@"assetGroups"];
		_assetGroups = [newAssets copy];
		[self didChangeValueForKey:@"assetGroups"];
		
		if ([self isViewLoaded])
			[self.tableView reloadData];
		
	} failureBlock:^(NSError *error) {
	
		[self.delegate albumListViewController:self didFailEnumeratingAssetGroupsWithError:error];
		
	}];
	
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
	
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [self.assetGroups count];
	
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";
	IRAQAlbumCell *cell = (IRAQAlbumCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (!cell)
		cell = [[IRAQAlbumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	
	ALAssetsGroup *group = (ALAssetsGroup *)[self.assetGroups objectAtIndex:indexPath.row];
	NSCParameterAssert([group isKindOfClass:[ALAssetsGroup class]]);
	cell.assetsGroup = group;
	
	return cell;
	
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	ALAssetsGroup *group = (ALAssetsGroup *)[self.assetGroups objectAtIndex:indexPath.row];
	NSCParameterAssert([group isKindOfClass:[ALAssetsGroup class]]);
	
	[self.delegate albumListViewController:self didSelectGroup:group];

}

@end
