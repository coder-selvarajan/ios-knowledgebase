# Mirror API

> Notes from avanderlee.com blog

Swift places a lot of emphasis on static typing, but it also supports rich metadata about types, which allows code to inspect and manipulate arbitrary values at runtime. This is exposed to Swift programmers through the Mirror API.

### What is Reflection?

Reflection in Swift comes down to printing out metadata information about a given value. Let’s take a look at an example of a struct representing an article and print out its metadata using the Mirror API:

```swift
struct Article {
    let title: String
    let author: String

    func publish() {
        // ..
    }
}

let article = Article(title: "Reflection in Swift", author: "Antoine van der Lee")
let mirror = Mirror(reflecting: article)
mirror.children.forEach { child in
    print("Found child '\(child.label ?? "")' with value '\(child.value)'")
}

// Prints:
// Found child 'title' with value 'Reflection in Swift'
// Found child 'author' with value 'Antoine van der Lee'
```

The console displays both labels and values without knowing anything about their types. The label is a copy of the property name where the value contains an Any type. It’s also worth pointing out that we don’t get any information about the publish() method as it’s not a child of Article since it doesn’t represent storage.

The above example shows us how the Mirror API works, resulting in reflecting the given value. You can traverse an object graph by performing the same reflecting logic on children of children.

### Reflecting a class

```Swift
final class ArticlePublisher {
    let blogTitle: String = "SwiftLee"
}
let publisher = ArticlePublisher()
Mirror(reflecting: publisher).children.forEach { child in
    print("Found child '\(child.label ?? "")' with value '\(child.value)'")
}
// Prints:
// Found child 'blogTitle' with value 'SwiftLee'
```

### Reflecting a tuple

```Swift
let tuple = ("Antoine", "van der Lee")
Mirror(reflecting: tuple).children.forEach { child in
    print("Found child '\(child.label ?? "")' with value '\(child.value)'")
}
// Prints:
// Found child '.0' with value 'Antoine'
// Found child '.1' with value 'van der Lee'
```

## Providing a custom Mirror description using CustomReflectable

The CustomReflectable protocol allows changing the Mirror description, which can be helpful in cases the default introspection result is not fulfilling. Some of the default types in Swift inherit from this protocol to provide custom reflection results, like an Array exposing its elements as unlabeled children:

```Swift
let array = ["Bernie", "Jaap", "Lady"]
Mirror(reflecting: array).children.forEach { child in
    print("Found child '\(child.label ?? "")' with value '\(child.value)'")
}
// Prints:
// Found child '' with value 'Bernie'
// Found child '' with value 'Jaap'
// Found child '' with value 'Lady'
```

The array example also explains why we must deal with an optional label.

You can use the CustomReflectable protocol as follows:

```Swift
extension Article: CustomReflectable {
    public var customMirror: Mirror {
        return Mirror(self, children: ["title": title])
    }
}
let articleExample = Article(title: "Reflection in Swift", author: "Antoine van der Lee")
Mirror(reflecting: articleExample).children.forEach { child in
    print("Found child '\(child.label ?? "")' with value '\(child.value)'")
}

// Before custom reflection:
// Found child 'title' with value 'Reflection in Swift'
// Found child 'author' with value 'Antoine van der Lee'
//
// After custom reflection:
// Found child 'title' with value 'Reflection in Swift'
```
