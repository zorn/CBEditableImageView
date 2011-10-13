# CBEditableImageView

CBEditableImageView is a subclass of NSImageView that resembles the editable image well as seen in System Preferences > Users (where people assign a profile image to their account). 

## Demo Movie

<http://media.clickablebliss.com/blog/movies/CBEditableImageViewDemo.mov>

## Details

CBEditableImageView adds the following functionality to NSImageView:

* On mouse hover, adds a tinted black look to the inner well to suggest to the user that this is editable. 
* On click, can present a context menu allowing the user to assign an image or clear it.
* Can send key events to its delegate to allow for mouse-free interaction.
* Fixes a bug in the native NSImageView where even when disabled it still accepts new images via drag and drop.

## Wanted

* Feedback on overall implementation.
* Popover API option in the delegate.

## BSD LICENSE

Copyright (c) 2011, Mike Zornek
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.