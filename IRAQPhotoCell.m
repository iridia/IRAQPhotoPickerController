//
//  IRAQPhotoCell.m
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQPhotoCell.h"
#import "IRAQPhotoCellSubclass.h"


@implementation IRAQPhotoCell
@synthesize asset = _asset;
@synthesize imageView = _imageView;
@synthesize selectionOverlay = _selectionOverlay;

- (id) initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {

	self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
	if (!self)
		return nil;
	
	[self commonInit];
	
	return self;

}

- (void) awakeFromNib {

	[super awakeFromNib];
	
	[self commonInit];

}

- (void) commonInit {
	
	self.selectionStyle = AQGridViewCellSelectionStyleNone;
	
}

- (UIImageView *) imageView {

	if (!_imageView) {
		
		UIImageView *imageView = [self newImageView];
		[self.contentView addSubview:imageView];
		_imageView = imageView;
	
	}
	
	return _imageView;

}

- (UIView *) selectionOverlay {

	if (!_selectionOverlay) {
	
		UIView *selectionOverlay = [self newSelectionOverlay];
		[self.contentView addSubview:selectionOverlay];
		_selectionOverlay = selectionOverlay;
	
	}
	
	return _selectionOverlay;

}

- (void) setAsset:(ALAsset *)asset {

	_asset = asset;
	
	self.imageView.image = [UIImage imageWithCGImage:[_asset thumbnail]];

}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated {

	NSTimeInterval const duration = animated ? 0.5f : 0.0f;
	NSTimeInterval const delay = 0.0f;
	UIViewAnimationOptions const options = UIViewAnimationOptionBeginFromCurrentState;
	
	[UIView animateWithDuration:duration delay:delay options:options animations:^{

		self.selectionOverlay.hidden = !selected;
		
	} completion:nil];

}

- (void) layoutSubviews {

	[super layoutSubviews];

	if (_imageView)
		[self.contentView sendSubviewToBack:_imageView];

}

- (UIImageView *) newImageView {

	//	Note that _imageView is weak
	//	So make it first, then add it to the content view
	//	then assign the weak ref
	
	//	This is mostly in place to allow creative IB usage

	CGRect rect = CGRectInset(self.contentView.bounds, 2.0f, 2.0f);
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
	
	imageView.layer.borderColor = [UIColor colorWithWhite:0.0f alpha:0.2f].CGColor;
	imageView.layer.borderWidth = 0.5f;
	
	imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.clipsToBounds = YES;
	
	return imageView;

}

- (UIView *) newSelectionOverlay {

	CGRect rect = CGRectInset(self.contentView.bounds, 2.0f, 2.0f);
	UIView *selectionOverlay = [[UIView alloc] initWithFrame:rect];
	
	selectionOverlay.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.65f];
	selectionOverlay.userInteractionEnabled = NO;
	selectionOverlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	selectionOverlay.hidden = !self.selected;
	
	return selectionOverlay;

}

@end
