# When to use weak self and why?

We all want to write good, beautiful and stable code. This includes preventing memory leaks, which we can, using `[weak self]` when writing a closure that needs access to `self`. But what's the real reason for needing this weak capture? And do we need it all the time? In this week's Quick Tip, I want to help you find an answer to this question so you can make more informed decisions about your capture lists in the future. We'll go over capture lists first, to make sure you know exactly what a capture list is. We'll then look at different kinds of captures and lastly, I will explain how you can make an informed decision when choosing the most appropriate type of capture list for any use case.

## **Understanding what a capture list is**

When you write a closure, it will implicitly capture all properties referenced inside of the closure. Let's look at a short code sample to illustrate this:

```swift
func multiply(by multiplier: Int) -> ((Int) -> Int) {
  return { (input: Int) -> Int in
    return input * multiplier
  }
}

var multiplier = 2
let multiplyTwo = multiply(by: multiplier) // you can now call multiplyTwo as if it's a function
multiplier = 4
let multiplyFour = multiply(by: multiplier) // you can now call multiplyFour as if it's a function
```

The preceding code sample shows a function that takes a multiplier and returns a closure that takes a different input and multiplies it with the multiplier that was passed to `multiply(by:)`. The closure that is returned from this function captures the `multiplier` and uses it as the multiplier for the input you give it. In practice, this means that calling `multiplyTwo(2)` will return `4` and `multiplyFour(2)` returns `8`. The `multiplier` variable that is defined does not affect the closure held by `multiplyTwo` or `multiplyFour` because of this capture behavior.

I know that this can be quite confusing when you've just started learning about closures, but bear with me as we go through some more examples.

Take a look at the following example:

```swift
var name = "Donny"
var appendToName = { (string: String) -> String in
  return name.appending(string)
}

let one = appendToName("Wals")
name = "D"
let two = appendToName("Wals")
```

What would you expect the values of `one` and `two` to be? Remember that I just explained how closures capture properties that are used inside of a closure.

If you expect `one` and `two` to both be `"DonnyWals"` I don't blame you, it seems to make sense! But unfortunately, this isn't correct. The value for `one` is `"DonnyWals"` and `two` is `"DWals"`. How this closure is different from the closure you saw before is that everything, from the closure to the property it references is in the same context. The closure can read the current value of `name` because it's on the same level. We can, however, explicitly capture `name` using a capture list as follows:

```swift
var name = "Donny"
var appendToCapturedName = { [name] (string: String) -> String in
  return name.appending(string)
}

let one = appendToCapturedName("Wals")
name = "D"
let two = appendToCapturedName("Wals")
```

When you run this code in a Playground, both `one` and `two` will equal `"DonnyWals"` because you explicitly told the closure to capture the current value of `name` by putting it in a capture list. This can be called an *explicit* or *strong* capture. You can capture more than one property in a capture list by comma separating them: `[property, anotherProperty]`.

You just learned about strong and implicit capturing of properties. Let's look at other kinds of captures.

## **Understanding different kinds of captures**

When you strongly capture a property, the closure will own this property. For value types like structs and enums, this means that the closure copies the current value of an object over to its own area in memory where it owns the object. When you do the same for a reference type, like a class, the closure will maintain a strong pointer reference to the object. To understand the implications of this, you need to know one thing about reference types: they are never deallocated as long as at least one other object holds a reference to them. When an object holds an unintended reference to a reference type, it could be considered a memory leak. If you're not sure what this means, don't worry, it should be a little bit clearer after the next code sample. The following code demonstrates the memory leak that I described earlier:

```swift
class MyClass {}
var instance: MyClass? = MyClass()

var aClosure = { [instance] in
  print(instance)
}

aClosure() // MyClass
instance = nil
aClosure() // MyClass
```

The second time we call `aClosure` we still print the same instance of `MyClass` because `aClosure` holds a strong reference to the instance. Sometimes this is exactly what we want, but usually, we don't want our closures to keep objects alive after they've been deinitialized. An example that comes to mind is a closure that might capture a view controller while it's waiting for a network request to finish. If the view controller is dismissed before the network request is finished, we want the view controller to be removed from memory, or deallocated. If the network request's completion closure has a strong reference to the view controller, the closure keeps the view controller alive because it still holds a reference to the view controller.

So how would we make this strong capture a not so strong capture? Well, how about we make it weak instead?

```swift
class MyClass {}
var instance: MyClass? = MyClass()

var aClosure = { [weak instance] in
  print(instance)
}

aClosure() // MyClass
instance = nil
aClosure() // nil
```

Because the closure only holds a weak reference to the instance of `MyClass`, the system doesn't count our closure's reference to `instance` which means that as soon as the playground releases its reference to our instance of `MyClass`, it can be deallocated. The downside here is that this might lead to subtle bugs where you don't immediately notice that `instance` was deallocated before your closure was called. If you want to assert that `instance` is still around when the closure is called, and want to crash your app if it's not you can use an `unowned` reference:

```swift
class MyClass {}
var instance: MyClass? = MyClass()

var aClosure = { [unowned instance] in
  print(instance)
}

aClosure() // MyClass
instance = nil
aClosure() // crash
```

The impact on memory for an `unowned` capture is pretty much the same as `weak`. It's very similar to safely unwrapping an optional value with `?` or doing so forcefully with `!` which crashes your app if the value to unwrap is `nil`. In practice, you'll find that `unowned` is almost never what you're looking for.

Now that you have some understanding of what `weak` and `unowned` are, and how you can implicitly or strongly capture a value, let's have a look at when you should use these different capture methods.

## **Knowing when to use weak, unowned, strong or implicit capture**

As mentioned at the start of this Quick Tip, a lot of developers use `[weak self]` in their closures to prevent memory leaks. But are memory leaks really that common when working with closures? Spoiler alert: they're not. In this section, you can think of `weak` and `unowned` as the same since their major difference is whether they crash your app when the referenced object is deallocated. We'll first look at when you might want to use an implicit capture. Then we'll look at strong capture and last we'll look at weak capture.

### **When to use implicit capture**

Implicit capture is often used when you're dealing with closures that capture `self`, where `self` is a value type, like a struct. Since structs don't have pointers that reference them, closures won't accidentally keep a struct alive for longer than it should. In fact, trying to use `weak` or `unowned` on a non-class type isn't allowed in Swift.

You can use implicit capture on reference types as long as you're certain that the closure you're calling won't be retained by the object that will receive your closure. A good example of this is performing work on a `DispatchQueue`:

```swift
class MyClass {
  func dispatchSomething() {
    DispatchQueue.global().async {
      // it's okay to implicitly capture self here
    }
  }
}
```

Since the closure passed to `async` isn't retained, you can safely capture it without a capture list. You know it's not retained because the closure is executed shortly after calling `async`, and it's only called once. If your closure is retained, for example when it's used as an event handler for an object, you should make sure to capture `self` weakly to avoid keeping a reference to self that you don't want. Keep in mind that you're often relying on implementation details when you're doing this so even though you don't have to use `weak self` here, it might be a good idea to limit your usage of implicit captures to code you own and control.

The easiest way to know whether a closure that you pass to a function is retained, is to check whether it's marked as `@escaping`. Closures that are not marked with `@escaping` do not leave the scope of the function that you pass it too which means that it can't be retained for longer than the function's scope. If you want to learn more about `@escaping`, take a look at [this post](https://www.donnywals.com/what-is-escaping-in-swift/).

### **When to use an explicit strong capture**

Strongly, or explicitly capturing references isn't done very often. It's most useful if you want to allow partial deallocation of objects. For example, if you perform a network request and want to store its result in a Core Data store without doing anything else, the object that initiated the request doesn't have to stick around; you only need the data store. An example of this might look as follows:

```swift
struct SomeDataSource {
  var storage: MyDataStore
  let networking: NetworkingLayer
  // more properties

  func refreshData() {
    networking.refresh { [storage] data in
      storage.persist(data)
    }
  }
}
```

Since the closure only requires the `storage` property, there's no need to capture `self` here since that would keep the entire `SomeDataSource` object around. Keep in mind though that the `storage` property is captured at the time the closure is created as I showed you earlier in this post. So in this case that means that the value of `storage` is captured when we call `refreshData`. If `MyDataStore` is a struct, that means that it's copied at capture-time in the closure and any changes that are made to `storage` after the closure is created are not visible inside of the closure.

If `MyDataStore` is a reference type, you would be able to see changes made to the instance that's captured in the closure, but if you change `storage` by assigning a new storage to it after `storage` is captured, you will have captured the old storage instead of the new one.

### **When to use weak and unowned captures**

Weak capture is by far the most common capture and it's usually a good default choice. It should typically be used when you don't want an object to stick around until the closure is performed, or if the closure is retained for an unknown amount of time which is often the case for network requests. Keep in mind that a closure with a weak capture will treat the captured property as an optional. So if you have a `[weak self]` in your capture list, you'll likely want to unwrap `self` in your closure body using `guard strongSelf = self else { return }` to make sure that `self` still exists by the time the closure is executed. Using `weak` and `unowned` is the only way to make 100% sure your reference type doesn't hang around in memory for longer than necessary. This makes it a good option if you're not sure which type of capture if most appropriate for your current use case.

## **In Summary**

And that's another Quick Tip that became much larger than I initially intended. Closures and capture lists have all kinds of subtle implications that are important to keep in mind while programming and I hope this post has given you some insights into why you sometimes need a `[weak self]` for reference types but can reference `self` freely in value types (remember, it's all about the reference count). You saw that you can even capture specific properties of an object if you don't need to capture the entire `self`. You can even apply `weak` or `unowned` to individual properties of an object to prevent your closures from keeping individual objects around.
