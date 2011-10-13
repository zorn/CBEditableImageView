# CBEditableImageView

CBEditableImageView is a subclass of NSImageView that resembles the editable image well as seen in System Preferences > Users (where people assign a profile image to their account). 

## Demo Movie

<http://media.clickablebliss.com/blog/movies/CBEditableImageViewDemo.mov>

## Details

CBEditableImageView adds the following functionality to NSImageView:

* On mouse hover, adds a tinted black look to the inner well to suggest to the user that this is editable. 
* On click, can present a context menu allowing the user to assign an image or clear it.
* Fixes a bug in the native NSImageView where even when disabled it still accepts new images via drag and drop.

## Wanted

* Feedback on overall implementation.
* Popover API option.
