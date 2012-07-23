# IRAQPhotoPickerController

Quick, dirty, (feature) rich photo picker with ALAssetsLibrary.  Lots of code not written, courtesy of [AQGridView](https://github.com/iridia/AQGridView).

## Sample

Look at the [Sample App](https://github.com/iridia/IRAQPhotoPickerController-Sample).  It’s basically still being worked on, but you can check the Console and verify that the picker works.

## What’s Inside

There’s an `IRAQPhotoPickerController`:

	@interface IRAQPhotoPickerController : UINavigationController
	
		- (IRAQPhotoPickerController *) initWithCompletion:(IRAQPhotoPickerControllerCallback)callback;
	
	@end

You can use it in a popover, present it modally, or put it in a container view controller.  The callback gives you an array of `ALAsset` objects, or an `NSError` if anything went wrong.

## Licensing

This project is in the public domain.  You can use it and embed it in whatever application you sell, and you can use it for evil.  However, it is appreciated if you provide attribution, by linking to the project page ([https://github.com/iridia/IRAQPhotoPickerController](https://github.com/iridia/IRAQPhotoPickerController)) from your application.

## Credits

*	Evadne Wu / [Twitter](http://twitter.com/evadne), [Info](http://radi.ws).
