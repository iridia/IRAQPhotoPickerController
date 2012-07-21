//
//  IRAQPhotoGridViewController.m
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQPhotoGridViewController.h"
#import "IRAQPhotoCell.h"
#import "AQGridView.h"


@interface IRAQPhotoGridViewController () <AQGridViewDelegate, AQGridViewDataSource>
@property (nonatomic, readonly, strong) ALAssetsGroup *group;
@property (nonatomic, readonly, strong) NSArray *assets;
@end


@implementation IRAQPhotoGridViewController
@synthesize delegate = _delegate;
@synthesize group = _group;
@synthesize assets = _assets;

- (id) initWithAssetsGroup:(ALAssetsGroup *)group {

	self = [self initWithNibName:nil bundle:nil];
	if (!self)
		return nil;
	
	_group = group;
	
	return self;

}

- (NSArray *) assets {

	if (!_assets) {
	
		ALAssetsGroup * const group = self.group;
		NSMutableArray * const allAssets = [NSMutableArray arrayWithCapacity:group.numberOfAssets];
		
		[group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
			
			if (result) {
				[allAssets addObject:result];
			}
			
		}];
	
		[self willChangeValueForKey:@"assets"];
		_assets = [allAssets copy];
		[self didChangeValueForKey:@"assets"];
	
	}
	
	return _assets;

}

- (void) loadView {

	if (self.nibName) {
	
		[super loadView];
	
	} else {
	
		self.view = [[AQGridView alloc] initWithFrame:[UIScreen mainScreen].bounds];
		self.view.backgroundColor = [UIColor whiteColor];
		
		self.gridView.delegate = self;
		self.gridView.dataSource = self;
		self.gridView.alwaysBounceVertical = YES;
		self.gridView.allowsSelection = YES;
	
	}

}

- (AQGridView *) gridView {

	return (AQGridView *)self.view;

}

- (void) setGridView:(AQGridView *)gridView {

	[self setView:gridView];

}

- (void) viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	[self.gridView reloadData];
	
}

- (NSUInteger) numberOfItemsInGridView:(AQGridView *)gridView {

	return [self.assets count];
	
}

- (CGSize) portraitGridCellSizeForGridView:(AQGridView *)gridView {

	return (CGSize){ 80.0f, 80.0f };

}

- (AQGridViewCell *) gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index {

	static NSString * const identifier = @"Cell";
	
	IRAQPhotoCell *cell = (IRAQPhotoCell *)[gridView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		CGSize const size = [self portraitGridCellSizeForGridView:gridView];
		cell = [[IRAQPhotoCell alloc] initWithFrame:(CGRect){ CGPointZero, size } reuseIdentifier:identifier];
	}
	
	NSCParameterAssert([cell isKindOfClass:[IRAQPhotoCell class]]);
	ALAsset * const asset = (ALAsset *)[self.assets objectAtIndex:index];
	NSCParameterAssert([asset isKindOfClass:[ALAsset class]]);
	
	cell.asset = asset;
	
	return cell;

}

- (void) gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index {

	//	Do something about this, we’re supposed to have multiple selection

}

@end
