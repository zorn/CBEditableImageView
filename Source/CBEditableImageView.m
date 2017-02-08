//
//  CBEditableImageWell.m
//  ProfitTrain
//
//  Created by Michael Zornek on 10/4/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import "CBEditableImageView.h"

#define hoverOverlayInset 7.0

@interface NSObject (CBEditableImageViewDelegateMethods)
- (NSMenu *)imageView:(CBEditableImageView *)tableView menuForEvent:(NSEvent *)event;
- (BOOL)sendAndSwallowKeyDownEventsForKey:(unichar)key;
- (void)imageView:(CBEditableImageView *)imageView recievedKeyDownEvent:(NSEvent *)event;
@end

@implementation CBEditableImageView

- (id)initWithFrame:(NSRect)frame {
    self = [super init];
    if (self) {
        self.trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds] options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways) owner:self userInfo:nil];
        [self addTrackingArea:self.trackingArea];
        
        self.isHovering = NO;
    }
    return self;
}

@synthesize delegate=_delegate;
@synthesize trackingArea=_trackingArea;
@synthesize isHovering=_isHovering;

#pragma mark -
#pragma mark NSView Methods

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:self.bounds];
    
    if (self.isHovering && self.isEnabled) {
        
    if (self.isEditable) {
        // draw black
        [[NSColor colorWithCalibratedWhite:0.000 alpha:0.300] set];
        NSRect fillRect = NSMakeRect(0, 0, self.bounds.size.width, 18);
        NSRectFillUsingOperation(fillRect, NSCompositeSourceOver);
    }
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender
{
    if ([self isEnabled]) {
        return [super performDragOperation:sender];
    } else {
        return NO;
    }
}

#pragma mark -
#pragma mark NSControl Methods

- (NSMenu *)menuForEvent:(NSEvent *)theEvent
{
	if (!self.isEnabled) {
        return [super menuForEvent:theEvent];
    }
    
    if ([[self delegate] respondsToSelector:@selector(imageView:menuForEvent:)]) {
		return [(NSObject *)[self delegate] imageView:self menuForEvent:theEvent];
	} else {
		return [super menuForEvent:theEvent];
	}
}

- (void)mouseDown:(NSEvent *)event;
{
    [self rightMouseDown:event];
}

- (void)keyDown:(NSEvent *)event
{
    if (!self.isEnabled) {
        return [super keyDown:event];
    }
    
    if ([[self delegate] respondsToSelector:@selector(imageView:recievedKeyDownEvent:)]) {
		unichar key = [[event charactersIgnoringModifiers] characterAtIndex:0];
        if ([self.delegate sendAndSwallowKeyDownEventsForKey:key]) {
            [(NSObject *)[self delegate] imageView:self recievedKeyDownEvent:event];
            return; // bail
        }
	}
    [super keyDown:event];
}

#pragma mark -
#pragma mark NSTrackingArea Methods

- (void)updateTrackingAreas 
{
    [super updateTrackingAreas];
    [self removeTrackingArea:self.trackingArea];
    self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways) owner:self userInfo:nil];
    [self addTrackingArea:self.trackingArea];
}

- (void)mouseEntered:(NSEvent*)theEvent {
    [super mouseEntered:theEvent];
    self.isHovering = YES;
    [self setNeedsDisplay];
}

- (void)mouseExited:(NSEvent*)theEvent {
    [super mouseExited:theEvent];
    self.isHovering = NO;
    [self setNeedsDisplay];
}

@end
