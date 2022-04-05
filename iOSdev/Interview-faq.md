# iOS Interview - FAQs

## What are the advantages of Swift over Objective-C?

- Swift is easier to read and maintain.
- Swift is safer & faster.
- Swift is unified with memory management.
- Swift support dynamic libraries.
- Swift Playgrounds encourages interactive coding.

## How to define baseclass?

A class which does not have a superclass is called the base-class.

## Internal access

Internal access enables entities to be used within any source file from their defining module, but not in any source file outside of the module. Internal access is the default level of access.

## Which class to use parsing?

`NSXML` class can be used to parse xml document.

## Difference between frame and bounds?

The bounds of an UIView is the rectangle, expressed as a location (x,y) and size (width, height) relative to its own coordinate system (0,0). The frame of an UIView is the rectangle, expressed as a location (x,y) and size (width, height) relative to the superview it is contained within.

## Explain what is the use of category in Objective-C?

The use of category in Objective-C is to extend an existing class by appending behavior that is useful only in certain situations. To add such extension to existing classes, objective –C provides extensions and categories. The syntax used to define a category is @interface keyword.

## which class are used to establish a connection between applications to the web server?

- NSURL
- NSURLRequest
- NSURLConnection

## Explain class definition in Objective-C?

A class definition begins with the keyword @interface followed by the interface (class) name, and the class body, closed by a pair of curly braces.  In Objective-C, all classed are retrieved from the base class called NSObject. It gives basic methods like memory allocation and initialization.

## What’s the difference between using a delegate and notification?

Both are used for sending values and messages to the interested parties. A delegate is for one-to-one communication and is a pattern promoted by Apple.

In delegation, the class raising events will have a property for the delegate and will typically expect it to implement some protocol. The delegating class can then call the delegates protocol methods.

Notification allows a class to broadcast events across the entire application to any interested parties. The broadcasting class doesn’t need to know anything about the listeners for this event, therefore notification is very useful in helping to decouple components in an application.

## Difference between function call and message?

The difference between function call and message is that a function and its arguments are linked together in the compiled code, but a message and a receiving object are not linked  until the program is executing and the message is sent.

## What is delegate?

Delegation is a commonly used pattern in object-oriented programming. It is a situation where an object, instead of performing a task itself, delegates that task to another, helper object. The helper object is called the delegate.

A delegate allows one object to send messages to another object when an event happens.

A delegate is just an object that another object sends messages to when certain things happen, so that the delegate can handle app-specific details the original object wasn't designed for. It's a way of customizing behavior without sub classing.

## What is service extension?

The service extension allows to change the content in a notification before it is presented.

Ojha, Bandana. 200+ Frequently Asked Interview Questions & Answers in iOS Development: Swift & Objective -C Programming (Interview Q & A Series Book 9) (p. 12). Kindle Edition.

## What is synchronized() block in objective C? What is the use of that?

The synchronized() directive locks a section of code for use by a single thread. Other threads are blocked until the thread exits the protected code.

## Explain final keyword into a class ?

A class that is declared final cannot be sub classed.

## What is the meaning of "assign" keyword?

Assign creates a reference from one object to another without increasing the retain count of the source object.

## What is the meaning of "atomic" keyword?

“atomic”, the synthesized setter/getter will ensure that a whole value is always returned from the getter or set by the setter, only single thread can access variable to get or set value at a time.

## Explain what are Responder Chain and First Responder?

A ResponderChain is a hierarchy of objects that can respond to events received. The first object in the ResponderChain is called the FirstResponder.

## What’s the difference between a xib and a storyboard?

Both are used in Xcode to layout screens (view controllers). A xib defines a single View or View Controller screen, while a storyboard shows many view controllers and shows the relationship between them.

## Explain AVFoundation framework.

AVFoundation allows us to work on a detailed level with time-based audio-visual data. With it, we can create, edit, analyze, and re-encode media files. AVFoundation has two sets of APIs, one is video and other one is audio.

## What is the difference between Synchronous & Asynchronous task ?

Synchronous: waits until the task has completed Asynchronous: completes a task in background and can notify you when complete
