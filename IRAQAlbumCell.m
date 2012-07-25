//
//  IRAQAlbumCell.m
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/25/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "IRAQAlbumCell.h"


@interface IRAQAlbumCell ()
@property (nonatomic, readwrite, weak) UILabel *numberLabel;
@end

@implementation IRAQAlbumCell
@synthesize assetsGroup = _assetsGroup;
@synthesize numberLabel = _numberLabel;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (!self)
		return nil;
	
	self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	self.imageView.contentMode = UIViewContentModeScaleAspectFill;
	
	return self;

}

- (UILabel *) numberLabel {

	if (!_numberLabel) {
	
		UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		numberLabel.textColor = [UIColor grayColor];
		numberLabel.font = [UIFont systemFontOfSize:17.0f];
		
		[self.contentView addSubview:numberLabel];
		
		_numberLabel = numberLabel;
	
	}
	
	return _numberLabel;

}

- (void) setAssetsGroup:(ALAssetsGroup *)assetsGroup {

	if (_assetsGroup == assetsGroup)
		return;
	
	_assetsGroup = assetsGroup;

	NSString * const groupName = [_assetsGroup valueForProperty:ALAssetsGroupPropertyName];
	NSString * const assetsCount = [NSString stringWithFormat:@"(%lu)", (long)[_assetsGroup numberOfAssets]];
	UIImage * const image = [UIImage imageWithCGImage:_assetsGroup.posterImage];
	
	self.textLabel.text = groupName;
	self.numberLabel.text = assetsCount;
	self.imageView.image = image;
	
	[self setNeedsLayout];

}

- (void) layoutSubviews {

	[super layoutSubviews];
	
	UILabel * const tl = self.textLabel;
	UILabel * const nl = self.numberLabel;
	[nl sizeToFit];
	
	CGFloat const padding = 10.0f;
	CGRect const tlFrame = tl.frame;
	tl.frame = (CGRect){
		tlFrame.origin,
		(CGSize){
			tlFrame.size.width - padding - CGRectGetWidth(nl.frame),
			tlFrame.size.height
		}
	};
	
	CGRect tlTextRect = [tl textRectForBounds:tl.bounds limitedToNumberOfLines:tl.numberOfLines];
	tlTextRect.origin.y = roundf(0.5f * (CGRectGetHeight(tl.bounds) - CGRectGetHeight(tlTextRect)));
	
	CGPoint tlBaselineEndPoint = [tl.superview convertPoint:(CGPoint) {
		CGRectGetMaxX(tlTextRect),
		CGRectGetMaxY(tlTextRect) + tl.font.descender
	} fromView:tl];
	
	nl.frame = (CGRect){
		(CGPoint){
			tlBaselineEndPoint.x + padding,
			tlBaselineEndPoint.y - nl.font.lineHeight - nl.font.descender
		},
		nl.frame.size
	};
	
}

@end
