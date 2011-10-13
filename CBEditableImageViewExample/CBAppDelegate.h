//
//  CBAppDelegate.h
//  CBEditableImageViewExample
//
//  Created by Michael Zornek on 10/13/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CBAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (strong) NSImage *mainImage;
@property (strong) NSNumber *shouldDisableImageView;

#pragma mark -
#pragma mark Actions

- (IBAction)editIcon:(id)sender;
- (IBAction)clearIcon:(id)sender;

@end
