//
//  UIViewController+IRAQAdditions.h
//  IRAQPhotoPickerController-Sample
//
//  Created by Evadne Wu on 7/21/12.
//  Copyright (c) 2012 Iridia Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (IRAQAdditions)

- (void) iraqPerformOnStabilized:(void(^)(void))block;

@end
