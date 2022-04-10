# iOS Interview - FAQs

<details><summary><b>What are the advantages of Swift over Objective-C?</b></summary><br/>

- Swift is easier to read and maintain.
- Swift is safer & faster.
- Swift is unified with memory management.
- Swift support dynamic libraries.
- Swift Playgrounds encourages interactive coding.

</details>

<details><summary><b>How to define baseclass?</b></summary><br/>
A class which does not have a superclass is called the base-class.
</details>

<details><summary><b>Internal access</b></summary><br/>

Internal access enables entities to be used within any source file from their defining module, but not in any source file outside of the module. Internal access is the default level of access.

</details>

<details><summary><b>Which class to use parsing?</b></summary><br/>

`NSXML` class can be used to parse xml document.

</details>

<details><summary><b>Difference between frame and bounds?
</b></summary><br/>

The bounds of an UIView is the rectangle, expressed as a location (x,y) and size (width, height) relative to its own coordinate system (0,0). The frame of an UIView is the rectangle, expressed as a location (x,y) and size (width, height) relative to the superview it is contained within.

</details>

<details><summary><b>
Explain what is the use of category in Objective-C?
</b></summary><br/>

The use of category in Objective-C is to extend an existing class by appending behavior that is useful only in certain situations. To add such extension to existing classes, objective –C provides extensions and categories. The syntax used to define a category is @interface keyword.

</details>

---

<details><summary><b>which class are used to establish a connection between applications to the web server?</b></summary><br/>

- NSURL
- NSURLRequest
- NSURLConnection
</details>

<details><summary><b>Explain class definition in Objective-C?</b></summary><br/>

A class definition begins with the keyword @interface followed by the interface (class) name, and the class body, closed by a pair of curly braces.  In Objective-C, all classed are retrieved from the base class called NSObject. It gives basic methods like memory allocation and initialization.

</details>

<details><summary><b>What’s the difference between using a delegate and notification?</b></summary><br/>

Both are used for sending values and messages to the interested parties. A delegate is for one-to-one communication and is a pattern promoted by Apple.

In delegation, the class raising events will have a property for the delegate and will typically expect it to implement some protocol. The delegating class can then call the delegates protocol methods.

Notification allows a class to broadcast events across the entire application to any interested parties. The broadcasting class doesn’t need to know anything about the listeners for this event, therefore notification is very useful in helping to decouple components in an application.

</details>

<details><summary><b>Difference between function call and message?</b></summary><br/>

The difference between function call and message is that a function and its arguments are linked together in the compiled code, but a message and a receiving object are not linked  until the program is executing and the message is sent.

</details>

<details><summary><b>What is delegate?</b></summary><br/>

Delegation is a commonly used pattern in object-oriented programming. It is a situation where an object, instead of performing a task itself, delegates that task to another, helper object. The helper object is called the delegate.

A delegate allows one object to send messages to another object when an event happens.

A delegate is just an object that another object sends messages to when certain things happen, so that the delegate can handle app-specific details the original object wasn't designed for. It's a way of customizing behavior without sub classing.

</details>

---

<details><summary><b>What is service extension?</b></summary><br/>

The service extension allows to change the content in a notification before it is presented.

Ojha, Bandana. 200+ Frequently Asked Interview Questions & Answers in iOS Development: Swift & Objective -C Programming (Interview Q & A Series Book 9) (p. 12). Kindle Edition.

</details>

<details><summary><b>What is synchronized() block in objective C? What is the use of that?</b></summary><br/>

The synchronized() directive locks a section of code for use by a single thread. Other threads are blocked until the thread exits the protected code.

</details>

<details><summary><b>Explain final keyword into a class ?</b></summary><br/>

A class that is declared final cannot be sub classed.

</details>

<details><summary><b>What is the meaning of "assign" keyword?</b></summary><br/>

Assign creates a reference from one object to another without increasing the retain count of the source object.

</details>

<details><summary><b>What is the meaning of "atomic" keyword?</b></summary><br/>

“atomic”, the synthesized setter/getter will ensure that a whole value is always returned from the getter or set by the setter, only single thread can access variable to get or set value at a time.

</details>

---

<details><summary><b>Explain what are Responder Chain and First Responder?</b></summary><br/>

A ResponderChain is a hierarchy of objects that can respond to events received. The first object in the ResponderChain is called the FirstResponder.

</details>

<details><summary><b>What’s the difference between a xib and a storyboard?</b></summary><br/>

Both are used in Xcode to layout screens (view controllers). A xib defines a single View or View Controller screen, while a storyboard shows many view controllers and shows the relationship between them.

</details>

<details><summary><b>Explain AVFoundation framework.</b></summary><br/>

AVFoundation allows us to work on a detailed level with time-based audio-visual data. With it, we can create, edit, analyze, and re-encode media files. AVFoundation has two sets of APIs, one is video and other one is audio.

</details>

<details><summary><b>What is the difference between Synchronous & Asynchronous task ?</b></summary><br/>

Synchronous: waits until the task has completed Asynchronous: completes a task in background and can notify you when complete

</details>

<details><summary><b>What is generics in Swift ?</b></summary><br/>

Generics create code that does not get specific about underlying data types.

</details>

---

<details><summary><b>Explain method swizzling ?</b></summary><br/>

Method swizzling is a well-known practice in Objective-C and in other languages that support dynamic method dispatching. Through swizzling, the implementation of a method can be replaced with a different one at runtime, by changing the mapping

between a specific #selector(method) and the function that contains its implementation.

To use method swizzling with your Swift classes there are two requirements that you must comply with:-

- The class containing the methods to be swizzled must extend NSObject.
- The methods you want to swizzle must have the dynamic attribute.
</details>

<details><summary><b>What is Hashable ?</b></summary><br/>

Hashable allows us to use our objects as keys in a dictionary. So, we can make our custom types.

</details>

<details><summary><b>Define App Bundle?</b></summary><br/>

When you build your iOS app, Xcode packages it as a bundle. A bundle is a directory in the file system that groups related resources together in one place. An iOS app bundle contains the app executable file and supporting resource files such as app icons, image files, and localized content.

</details>

<details><summary><b>What is Dynamic Dispatch ?</b></summary><br/>

Dynamic Dispatch is the process of selecting which implementation of a polymorphic operation that’s a method or a function to call at run time.

</details>

<details><summary><b>What is ARC ?</b></summary><br/>

It stands for Automatic Reference Counting. ARC is a compiler feature that provides automatic memory management for Objective C Objects, so that developers can focus primarily on building application functionality and not worry about retain and releases.

</details>

---
