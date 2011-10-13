//
//  CBAppDelegate.m
//  CBEditableImageViewExample
//
//  Created by Michael Zornek on 10/13/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import "CBAppDelegate.h"
#import <Quartz/Quartz.h>

@interface CBAppDelegate ()
- (IKPictureTaker *)configuredPictureTaker;
- (void)launchPictureTaker:(id)sender;
@end

@implementation CBAppDelegate

@synthesize window = _window;
@synthesize mainImage=_mainImage;
@synthesize shouldDisableImageView=_shouldDisableImageView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

#pragma mark -
#pragma mark Actions

- (IBAction)editIcon:(id)sender
{
    [self launchPictureTaker:self];
}

- (IBAction)clearIcon:(id)sender
{
    self.mainImage = nil;
}

#pragma mark -
#pragma mark IKImagePicker

- (IKPictureTaker *)configuredPictureTaker
{
    IKPictureTaker *pictureTaker = [IKPictureTaker pictureTaker];
	[pictureTaker setValue:[NSNumber numberWithBool:YES] forKey:IKPictureTakerShowEffectsKey];
	//[pictureTaker setValue:[NSNumber numberWithBool:NO] forKey:IKPictureTakerAllowsVideoCaptureKey];
	[pictureTaker setValue:[NSNumber numberWithBool:YES] forKey:IKPictureTakerAllowsFileChoosingKey];
	[pictureTaker setValue:[NSNumber numberWithBool:YES] forKey:IKPictureTakerShowRecentPictureKey];
	[pictureTaker setValue:[NSNumber numberWithBool:YES] forKey:IKPictureTakerUpdateRecentPictureKey];
	[pictureTaker setValue:[NSNumber numberWithBool:YES] forKey:IKPictureTakerAllowsEditingKey];
	//[pictureTaker setValue:[NSString stringWithString:@"Drop an Image Here"] forKey:IKPictureTakerInformationalTextKey];
	//[pictureTaker setValue:[NSValue valueWithSize:NSMakeSize(256,256)] forKey:IKPictureTakerOutputImageMaxSizeKey];
	//[pictureTaker setValue:[NSValue valueWithSize:NSMakeSize(100, 100)] forKey:IKPictureTakerCropAreaSizeKey];
    return pictureTaker;
}

- (void)launchPictureTaker:(id)sender
{
    IKPictureTaker *pictureTaker = [self configuredPictureTaker];
    [pictureTaker setInputImage:self.mainImage];
    [pictureTaker beginPictureTakerSheetForWindow:self.window withDelegate:self didEndSelector:@selector(pictureTakerDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (void)pictureTakerDidEnd:(IKPictureTaker *)pictureTaker returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    if(returnCode == NSOKButton) {
        NSImage *outputImage = [pictureTaker outputImage];
        self.mainImage = outputImage;
    }
}

@end
