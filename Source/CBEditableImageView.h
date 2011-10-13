//
//  CBEditableImageWell.h
//  ProfitTrain
//
//  Created by Michael Zornek on 10/4/11.
//  Copyright (c) 2011 Clickable Bliss. All rights reserved.
//

#import <AppKit/AppKit.h>

@protocol CBEditableImageViewDelegate;

@interface CBEditableImageView : NSImageView

@property (weak) IBOutlet id <CBEditableImageViewDelegate> delegate;
@property (strong) NSTrackingArea *trackingArea;
@property (assign) BOOL isHovering;

@end

@protocol CBEditableImageViewDelegate <NSObject>
- (NSMenu *)imageView:(CBEditableImageView *)imageView menuForEvent:(NSEvent *)event;
- (BOOL)sendAndSwallowKeyDownEventsForKey:(unichar)key;
- (void)imageView:(CBEditableImageView *)imageView recievedKeyDownEvent:(NSEvent *)event;
@end