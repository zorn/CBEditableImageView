//
//  EditableImageViewDelegate.m
//  CBEditableImageViewExample
//
//  Created by Michael Zornek on 10/13/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import "EditableImageViewDelegate.h"
#import "CBEditableImageView.h"
#import "CBAppDelegate.h"

@implementation EditableImageViewDelegate

@synthesize appDelegate;

- (NSMenu *)imageView:(CBEditableImageView *)imageView menuForEvent:(NSEvent *)event
{
    NSMenu *contextMenu = [[NSMenu alloc] initWithTitle:@"Editable Image View Context Menu"];    
    
    NSMenuItem *menu;
    
    menu = [[NSMenuItem alloc] init];
    [menu setTitle:@"Edit Icon…"];
    [menu setTarget:self.appDelegate];
    [menu setAction:@selector(editIcon:)];
    [contextMenu addItem:menu];
    
    menu = [[NSMenuItem alloc] init];
    [menu setTitle:@"Clear Icon"];
    [menu setTarget:self.appDelegate];
    [menu setAction:@selector(clearIcon:)];
    [contextMenu addItem:menu];
    
    return contextMenu;
}

- (BOOL)sendAndSwallowKeyDownEventsForKey:(unichar)key
{
    if (key == NSDeleteCharacter || key == ' ' || key == NSEnterCharacter || key == NSNewlineCharacter || key == NSCarriageReturnCharacter) {
        return YES;
    } else {
        return NO;
    }
}

- (void)imageView:(CBEditableImageView *)imageView recievedKeyDownEvent:(NSEvent *)event
{
    if ([event isARepeat]) {
        return; // bail
    }
    
    unichar key = [[event charactersIgnoringModifiers] characterAtIndex:0];
    if (key == NSDeleteCharacter) {
        [self.appDelegate clearIcon:self];
    } else if (key == ' ' || key == NSEnterCharacter || key == NSNewlineCharacter || key == NSCarriageReturnCharacter) {
        [self.appDelegate editIcon:self];
    }
}

@end
