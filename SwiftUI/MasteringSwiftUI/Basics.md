# SwiftUI Basics

Below content is an excerpt From - Mastering SwiftUI (Supports iOS 14 and Xcode 12) Book By Simon Ng and from Standford University course by Paul Hegarty.

`@main` is a SwiftUI wrapper around the main app view. It is the root view of the app.

Swift supports object oriented programing and functional programming.. SwiftUI is essentially using functional programming via structs.

Functional programming says nothing where data is stored but it talks about what data there is and how it should be and all.
It does not encapsulate the data.

View is something that displays elements and captures user input events..

```
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Here the ContentView struct behaves like a view. the 'body' is a variable of `some view` which means it can have any type of view. It can be a single view or a combinar view(that combines many views inside like HStack, ZStack etc... Paul Hegarty used to call them as bag of legos).

Sometimes applying modifiers on combiner view will make the inner views applied with the modifier. For example if you apply foreground color then it will be applied to all the inner views.

## Imperative Vs Declarative

Instead of focusing on programming, let's talk about cooking a pizza. Let’s assume you are instructing someone else (a helper) to prepare the pizza, you can either do it imperatively or declaratively. To cook the pizza imperatively, you tell your helper each of the instructions clearly like a recipe:

- Heat Oven
- Prepare dough
- Roll out dough
- Spoon tomato sauce
- Place toppings
- Bake the pizza for 10 minutes

On the other hand, if you cook it in a declarative way, you do not need to specify the step by step instructions but just describe how you would like the pizza cooked. Thick or thin crust? Pepperoni and bacon, or just a classic Margherita with tomato sauce? 10-inch or 16-inch? The helper will figure out the rest and cook the pizza for you.

That's the core difference between the term imperative and declarative.

## The Combine Approach

If you are an experienced developer, you may find it strange that SwiftUI doesn't use a view controller as a central building block for talking to the view and the model.

Communications and data sharing between views are now done via another brand new framework called Combine.

## Learn once, apply anywhere

With SwiftUI, Apple offers developers a unified UI framework for building user interfaces on all types of Apple devices. The UI code written for iOS can be easily ported to your watchOS/macOS/watchOS app without modifications or with very minimal modifications. This is made possible thanks to the declarative UI framework.

The beauty of this unified framework is that you can reuse most of the code on all Apple platforms without making any changes. SwiftUI does the heavy lifting to render the corresponding controls and layout.

## Interfacing with UIKit/AppKit/WatchKit

SwiftUI is designed to work with the existing frameworks like UIKit for iOS and AppKit for macOS. Apple provides several representable protocols for you to adopt in order to wrap a view or controller into SwiftUI.

The representable protocols for existing UI frameworks:

![Representable-protocol](images/Representable-protocol.png)

### Porting WKWebView to SwiftUI

```swift
import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(url: "https://www.apple.com")
    }
}

struct WebView : UIViewRepresentable {
    let url: String

    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.load(URLRequest(url: URL(string: url)!))

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }
}
```
