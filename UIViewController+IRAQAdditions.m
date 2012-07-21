//
//  UIViewController+IRAQAdditions.m
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import "UIViewController+IRAQAdditions.h"

@implementation UIViewController (IRAQAdditions)

- (void) iraqPerformOnStabilized:(void (^)(void))block {

	if ([self isBeingPresented] || [self isBeingDismissed]) {
	
		CFRunLoopPerformBlock(CFRunLoopGetMain(), kCFRunLoopCommonModes, ^{
			
			[self iraqPerformOnStabilized:block];
			
		});
		
		return;
	
	}
	
	block();

}

@end
