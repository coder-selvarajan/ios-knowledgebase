# Closure

Notes from https://www.donnywals.com/

Closures are a powerful programming concept that enable many different programming patterns. However, for lots of beginning programmers, closures can be tricky to use and understand. This is especially true when closures are used in an asynchronous context. For example, when they’re used as completion handlers or if they’re passed around in an app so they can be called later.

In this post, I will explain what closures are in Swift, how they work, and most importantly I will show you various examples of closures with increasing complexity. By the end of this post you will understand everything you need to know to make effective use of closures in your app.

If by the end of this post the concept of closures is still a little foreign, that’s okay. In that case, I would recommend you take a day or two to process what you’ve read and come back to this post later; closures are by no means a simple topic and it’s okay if you need to read this post more than once to fully grasp the concept.

## **Understanding what closures are in programming**

Closures are by no means a unique concept to Swift. For example, languages like JavaScript and Python both have support for closures. A closure in programming is defined as an executable body of code that captures (or closes over) values from its environment. In some ways, you can think of a closure as an instance of a function that has access to a specific context and/or captures specific values and can be called later.

Let’s look at a code example to see what I mean by that:

```swift
var counter = 1

let myClosure = {
    print(counter)
}

myClosure() // prints 1
counter += 1
myClosure() // prints 2
```

In the above example, I’ve created a simple closure called `myClosure` that prints the current value of my `counter` property. Because `counter` and the closure exist in the same scope, my closure can read the current value of `counter`. If I want to run my closure, I call it like a function `myClosure()`. This will cause the code to print the current value of `counter`.

We can also capture the value of `counter` at the time the closure is created as follows:

```swift
var counter = 1

let myClosure = { [counter] in
    print(counter)
}

myClosure() // prints 1
counter += 1
myClosure() // prints 1
```

By writing `[counter] in` we create a capture list that takes a snapshot of the current value of `counter` which will cause us to ignore any changes that are made to `counter`. We’ll take a closer look at capture lists in a bit; for now, this is all you need to know about them.

The nice thing about a closure is that you can do all kinds of stuff with it. For example, you can pass a closure to a function:

```swift
var counter = 1

let myClosure = {
    print(counter)
}

func performClosure(_ closure: () -> Void) {
    closure()
}

performClosure(myClosure)
```

This example is a little silly, but it shows how closures are “portable”. In other words, they can be passed around and called whenever needed.

In Swift, a closure that’s passed to a function can be created inline:

```swift
performClosure({
    print(counter)
})
```

Or, when using Swift’s trailing closure syntax:

```swift
performClosure {
    print(counter)
}
```

Both of these examples produce the exact same output as when we passed `myClosure` to `performClosure`.

Another common use for closures comes from functional programming. In functional programming functionality is modeled using functions rather than types. This means that creating an object that will add some number to an input isn’t done by creating a struct like this:

```swift
struct AddingObject {
    let amountToAdd: Int

    func addTo(_ input: Int) -> Int {
        return input + amountToAdd
    }
}
```

Instead, the same functionality would be achieved through a function that returns a closure:

```swift
func addingFunction(amountToAdd: Int) -> (Int) -> Int {
    let closure = { input in
        return amountToAdd + input
    }

    return closure
}
```

The above function is just a plain function that returns an object of type `(Int) -> Int`. In other words, it returns a closure that takes one `Int` as an argument, and returns another `Int`. Inside of `addingFunction(amountToAdd:)`, I create a closure that takes one argument called `input`, and this closure returns `amountToAdd + input`. So it captures whatever value we passed for `amountToAdd`, and it adds that value to `input`. The created closure is then returned.

This means that we can create a function that always adds 3 to its input as follows:

```swift
let addThree = addingFunction(amountToAdd: 3)
let output = addThree(5)
print(output) // prints 8
```

In this example we took a function that takes two values (the base 3, and the value 5) and we converted it into two separately callable functions. One that takes the base and returns a closure, and one that we call with the value. The act of doing this is called currying. I won’t go into currying more for now, but if you’re interested in learning more, you know what to Google for.

The nice thing in this example is that the closure that’s created and returned by `addingFunction` can be called as often and with as many inputs as we’d like. The result will always be that the number three is added to our input.

While not all syntax might be obvious just yet, the principle of closures should slowly start to make sense by now. A closure is nothing more than a piece of code that captures values from its scope, and can be called at a later time. Throughout this post I’ll show you more examples of closures in Swift so don’t worry if this description still is a little abstract.

Before we get to the examples, let’s take a closer look at closure syntax in Swift.

## **Understanding closure syntax in Swift**

While closures aren’t unique to Swift, I figured it’s best to talk about syntax in a separate section. You already saw that the type of a closure in Swift uses the following shape:

```swift
() -> Void
```

This looks very similar to a function:

```swift
func myFunction() -> Void
```

Except in Swift, we don’t write `-> Void` after every function because every function that doesn’t return anything implicitly returns `Void`. For closures, we must always write down the return type even when the closure doesn’t return anything.

Another way that some folks like to write closures that return nothing is as follows:

```swift
() -> ()
```

Instead of `-> Void` or "returns `Void`", this type specifies `-> ()` or "returns empty tuple". In Swift, `Void` is a type alias for an empty tuple. I personally prefer to write `-> Void` at all times because it communicates my intent much clearer, and it's generally less confusing to see `() -> Void` rather than `() -> ()`. Throughout this post you won't see `-> ()` again, but I did want to mention it since [a friend](https://twitter.com/theoriginalbit) pointed out that it would be useful.

A closure that takes arguments is defined as follows:

```swift
let myClosure: (Int, Int) -> Void
```

This code defines a closure that takes two `Int` arguments and returns `Void`. If we were to write this closure, it would look as follows:

```swift
let myClosure: (Int, Int) -> Void = { int1, int2 in
  print(int1, int2)
}
```

In closures, we always write the argument names followed by `in` to signal the start of your closure body. The example above is actually a shorthand syntax for the following:

```swift
let myClosure: (Int, Int) -> Void = { (int1: Int, int2: Int) in
  print(int1, int2)
}
```

Or if we want to be even more verbose:

```swift
let myClosure: (Int, Int) -> Void = { (int1: Int, int2: Int) -> Void in
  print(int1, int2)
}
```

Luckily, Swift is smart enough to understand the types of our arguments and it’s smart enough to infer the return type of our closure from the closure body so we don’t need to specify all that. However, sometimes the compiler gets confused and you’ll find that adding types to your code can help.

With this in mind, the code from earlier should now make more sense:

```swift
func addingFunction(amountToAdd: Int) -> (Int) -> Int {
    let closure = { input in
        return amountToAdd + input
    }

    return closure
}
```

While `func addingFunction(amountToAdd: Int) -> (Int) -> Int` might look a little weird you now know that `addingFunction` returns `(Int) -> Int`. In other words a closure that takes an `Int` as its argument, and returns another `Int`.

Earlier, I mentioned that Swift has capture lists. Let’s take a look at those next.

## **Understanding capture lists in closures**

A capture list in Swift specifies values to capture from its environment. Whenever you want to use a value that is not defined in the same scope as the scope that your closure is created in, or if you want to use a value that is owned by a class, you need to be explicit about it by writing a capture list.

Let’s go back to a slightly different version of our first example:

```swift
class ExampleClass {
    var counter = 1

    lazy var closure: () -> Void = {
        print(counter)
    }
}
```

This code will not compile due to the following error:

```swift
Reference to property `counter` requires explicit use of `self` to make capture semantics explicit.
```

In other words, we’re trying to capture a property that belongs to a class and we need to be explicit in how we capture this property.

One way is to follow the example and capture `self`:

```swift
class ExampleClass {
    var counter = 1

    lazy var closure: () -> Void = { [self] in
        print(counter)
    }
}
```

A capture list is written using brackets and contains all the values that you want to capture. Capture lists are written before argument lists.

This example has an issue because it strongly captures `self`. This means that `self` has a reference to the closure, and the closure has a strong reference to `self`. We can fix this in two ways:

1. We capture `self` weakly
2. We capture `counter` directly

In this case, the first approach is probably what we want:

```swift
class ExampleClass {
    var counter = 1

    lazy var closure: () -> Void = { [weak self] in
        guard let self = self else {
            return
        }
        print(self.counter)
    }
}

let instance = ExampleClass()
instance.closure() // prints 1
instance.counter += 1
instance.closure() // prints 2
```

Note that inside of the closure I use Swift’s regular `guard let` syntax to unwrap `self`.

If I go for the second approach and capture `counter`, the code would look as follows:

```swift
class ExampleClass {
    var counter = 1

    lazy var closure: () -> Void = { [counter] in
        print(counter)
    }
}

let instance = ExampleClass()
instance.closure() // prints 1
instance.counter += 1
instance.closure() // prints 1
```

The closure itself looks a little cleaner now, but the value of `counter` is captured when the `lazy var closure` is accessed for the first time. This means that the closure will capture whatever the value of `counter` is at that time. If we increment the counter before accessing the closure, the printed value will be the incremented value:

```swift
let instance = ExampleClass()
instance.counter += 1
instance.closure() // prints 2
instance.closure() // prints 2
```

It’s not very common to actually want to capture a value rather than `self` in a closure but it’s possible. The caveat to keep in mind is that a capture list will capture the current value of the captured value. In the case of `self` this means capturing a pointer to the instance of the class you’re working with rather than the values in the class itself.

For that reason, the example that used `weak self` to avoid a retain cycle did read the latest value of `counter`.

If you want to learn more about `weak self`, take a look at [this post](https://www.donnywals.com/when-to-use-weak-self-and-why/) that I wrote earlier.

Next up, some real-world examples of closures in Swift that you may have seen at some point.

## **Higher order functions and closures**

While this section title sounds really fancy, a higher order function is basically just a function that takes another function. Or in other words, a function that takes a closure as one of its arguments.

If you think this is probably an uncommon pattern in Swift, how does this look?

```swift
let strings = [1, 2, 3].map { int in
    return "Value \(int)"
}
```

There’s a very good chance that you’ve written something similar before without knowing that `map` is a higher order function, and that you were passing it a closure. The closure that you pass to `map` takes a value from your array, and it returns a new value. The `map` function’s signature looks as follows:

```swift
func map<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T]
```

Ignoring the generics, you can see that map takes the following closure: `(Self.Element) throws -> T` this should look familiar. Note that closures can throw just like functions can. And the way a closure is marked as throwing is exactly the same as it is for functions.

The `map` function immediately executes the closure it receives. Another example of such a function is `DispatchQueue.async`:

```swift
DispatchQueue.main.async {
    print("do something")
}
```

One of the available `async` function overloads on `DispatchQueue` is defined as follows:

```swift
func async(execute: () -> Void)
```

As you can see, it’s “just” a function that takes a closure; nothing special.

Defining your own function that takes a closure is fairly straightforward as you’ve seen earlier:

```swift
func performClosure(_ closure: () -> Void) {
    closure()
}
```

Sometimes, a function that takes a closure will store this closure or pass it elsewhere. These closures are marked with `@escaping` because they escape the scope that they were initially passed to. To learn more about `@escaping` closures, take a look at [this post](https://www.donnywals.com/what-is-escaping-in-swift/).

In short, whenever you want to pass a closure that you received to another function, or if you want to store your closure so it can be called later (for example, as a completion handler) you need to mark it as `@escaping`.

With that said, let’s see how we can use closures to inject functionality into an object.

## **Storing closures so they can be used later**

Often when we’re writing code, we want to be able to inject some kind of abstraction or object that allows us to decouple certain aspects of our code. For example, a networking object might be able to construct `URLRequests`, but you might have another object that handles authentication tokens and setting the relevant authorization headers on a `URLRequest`.

You could inject an entire object into your `Networking` object, but you could also inject a closure that authenticates a `URLRequest`:

```swift
struct Networking {
    let authenticateRequest: (URLRequest) -> URLRequest

    func buildFeedRequest() -> URLRequest {
        let url = URL(string: "https://donnywals.com/feed")!
        let request = URLRequest(url: url)
        let authenticatedRequest = authenticateRequest(request)

        return authenticatedRequest
    }
}
```

The nice thing about is that you can swap out, or mock, your authentication logic without needing to mock an entire object (nor do you need a protocol with this approach).

The generated initializer for `Networking` looks as follows:

```swift
init(authenticateRequest: @escaping (URLRequest) -> URLRequest) {
    self.authenticateRequest = authenticateRequest
}
```

Notice how `authenticateRequest` is an `@escaping` closure because we store it in our struct which means that the closure outlives the scope of the initializer it’s passed to.

In your app code, you could have a `TokenManager` object that retrieves a token, and you can then use that token to set the authorization header on your request:

```swift
let tokenManager = TokenManager()
let networking = Networking(authenticateRequest: { urlRequest in
    let token = tokenManager.fetchToken()
    var request = urlRequest
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    return request
})

let feedRequest = networking.buildFeedRequest()
print(feedRequest.value(forHTTPHeaderField: "Authorization")) // a token
```

What’s cool about this code is that the closure that we pass to `Networking` captures the `tokenManager` instance so we can use it inside of the closure body. We can ask the token manager for its current token, and we can return a fully configured request from our closure.

In this example, the closure is injected as a function that can be called whenever we need to authenticate a request. The closure can be called as often as needed, and its body will be run every time we do. Just like a function is run every time you call it.

As you can see in the example, the `authenticateRequest` is called from within `buildFeedRequest` to create an authenticated `URLRequest`.

Storing closures and calling them later is a very powerful pattern but beware of retain cycles. Whenever an `@escaping` closure captures its owner strongly, you’re almost always creating a retain cycle that should be solved by weakly capturing `self` (since in most cases `self` is the owner of the closure).

When you combine what you’ve already learned, you can start reasoning about closures that are called asynchronously, for example as completion handlers.

## **Closures and asynchronous tasks**

Before Swift had async/await, a lot of asynchronous APIs would communicate their results back in the form of completion handlers. A completion handler is nothing more than a regular closure that’s called to indicate that some piece of work has completed or produced a result.

This pattern is important because in a codebase without async/await, an asynchronous function returns *before* it produces a result. A common example of this is using `URLSession` to fetch data:

```swift
URLSession.shared.dataTask(with: feedRequest) { data, response, error in
    // this closure is called when the data task completes
}.resume()
```

The completion handler that you pass to the `dataTask` function (in this case via trailing closure syntax) is called once the data task completes. This could take a few milliseconds, but it could also take much longer.

Because our closure is called at a later time, a completion handler like this one is always defined as `@escaping`because it escapes the scope that it was passed to.

What’s interesting is that asynchronous code is inherently complex to reason about. This is *especially* true when this asynchronous code uses completion handlers. However, knowing that completion handlers are just regular closures that are called once the work is done can really simplify your mental model of them.

So what does defining your own function that takes a completion handler look like then? Let’s look at a simple example:

```swift
func doSomethingSlow(_ completion: @escaping (Int) -> Void) {
    DispatchQueue.global().async {
        completion(42)
    }
}
```

Notice how in the above example we don’t actually store the `completion` closure. However, it is marked as `@escaping`. The reason for this is that we call the closure from another closure. This other closure is a new scope which means that it escapes the scope of our `doSomethingSlow` function.

If you’re not sure whether your closure should be escaping or not, just try and compile your code. The compiler will automatically detect when your non-escaping closure is, in fact, escaping and should be marked as such.

## **Summary**

Wow! You’ve learned a lot in this post. Even though closures are a complex topic, I hope that this post has helped you understand them that much better. The more you use closures, and the more you expose yourself to them, the more confident you will feel about them. In fact, I’m sure that you’re already getting lots of exposure to closures but you just might not be consciously aware of it. For example, if you’re writing SwiftUI you’re using closures to specify the contents of your `VStacks`, `HStacks`, your `Button` actions, and more.

If you feel like closures didn’t quite click for you just yet, I recommend that you come back to this post in a few days. This isn’t an easy topic, and it might take a little while for it to sink in. Once the concept clicks, you’ll find yourself writing closures that take other closures while returning more closures in no time. After all, closures can be passed around, held onto, and executed whenever you feel like it.
