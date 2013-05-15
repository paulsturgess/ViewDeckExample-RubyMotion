# ViewDeckExample-RubyMotion

This an example application of [ViewDeck](https://github.com/Inferis/ViewDeck)
written in [RubyMotion](http://www.rubymotion.com).

It is a port of the original Objective-C version: [ViewDeckExample](https://github.com/Inferis/ViewDeck/tree/master/ViewDeckExample).

## What is ViewDeck?
ViewDeck makes it easy to implement the sliding panel user interface made
popular by the Facebook iOS app.

## So what exactly is this example application?

* It uses RubyMotion 2.0
* RVM and bundler are used to manage dependencies
* ViewDeck itself is included via its' [CocoaPod](http://cocoapods.org)

I've left the original Objective-C implementation as comments in the code.

It's not 100% the same as parts of the interface, in the original example app,
were implemented using Interface Builder.

For example, all the layout and buttons used in the RightViewController are
coded manually, whereas the original example app used a Nib file.

Essentially all new methods I have introduced, will not have a corresponding
Objective-C comment.