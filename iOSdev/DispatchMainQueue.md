# Dispatch main queue

Lots of iOS developers eventually run into code that calls upon `DispatchQueue.main`. It's often clear that this is done to update the UI, but I've seen more than a handful of cases where developers use `DispatchQueue.main` as an attempt to get their code to work if the UI doesn't update as they expect, or if they run into crashes they don't understand. For that reason, I would like to dedicate this post to the question "When should I use DispatchQueue.main? And Why?".

## **Understanding what the main dispatch queue does**

In iOS, we use dispatch queues to perform work in parallel. This means that you can have several dispatch queues running at the same time, and they can all be performing tasks simultaneously. In general, dispatch queues will only perform one task at a time in a first-in, first-out kind of fashion. They can, however, be configured to schedule work concurrently.

The main dispatch queue is a queue that runs one task at a time. It's also the queue that performs all layout updates. If somebody talks about the importance of not blocking the main thread, what they're really saying is that they don't want to keep the main dispatch queue busy for too long. If you keep the main queue busy too long, you will notice that your application's scroll performance becomes choppy, animations stutter and buttons become unresponsive.

The reason for this is that the main queue is responsible for everything UI related, but like we already established, the main queue is a serial queue. So if the main queue is busy doing something, it can't respond to user input or draw new frames of your animation.

A lot of code in iOS is code that can take a while to run. For example, making a network request is a good example of code that is very slow to execute. Once the network call is sent off to the server, the code has to wait for a response. While waiting, that queue isn't doing anything else. When the response comes back a couple of seconds later, the queue can process the results and move on to the next task. If you would perform this work on the main queue, your app wouldn't be able to draw any UI or respond to user input for the entire duration of the network request.

We can summarise this whole section in just a short sentence. The main queue is responsible for drawing UI and responding to user input. In the next section, we'll take a closer look at when we should use `DispatchQueue.main` and what that does exactly.

## **Using DispatchQueue.main in practice**

Sticking with the example of making a network call, you can assume that network calls are made on their own queue, away from the main queue. Before we continue, I want to refresh your memory and show you what the code for a network call looks like:

```swift
URLSession.shared.dataTask(with: someURL) { data, response, error in

}
```

The data task is created with a completion closure which is called when the network call completes. Since the data that's returned by the server might still need to be processed, iOS calls your completion closure on a background queue. Usually, this is great. I don't think there's any situation where you won't want to do any processing to the data that you receive from the server at all. Sometimes you might have to do more processing than other times, but no processing at all is very rare. Once you're done processing the data however, you'll probably want to update your UI.

Since you know you're not on the main queue when handling a network response, you'll need to use `DipatchQueue.main` to make sure your UI updates on the main queue. The following code is an example of reloading a table view on the main queue.

```swift
DispatchQueue.main.async {
  self.tableView.reload()
}
```

This code looks simple enough, right? But what's really going on here?

`DispatchQueue.main` is an instance of `DispatchQueue`. All dispatch queues can schedule their work to be executed `sync` or `async`. Typically you will want to schedule work `async` because scheduling your work synchronously would halt the execution of the current thread, wait for the target thread execute the closure that you pass to `sync`, and then resume the current thread. Using `async` allows the current thread to resume while the target thread can schedule and perform your closure when needed. Let's look at an example:

```swift
func executesAsync() {
  var result = 0

  DispatchQueue.global().async {
    result = 10 * 10
  }

  print(result) // 0
}

func executesSync() {
  var result = 0

  DispatchQueue.global().sync {
    result = 10 * 10
  }

  print(result) // 100
}
```

Both of the preceding functions look very similar. The main difference here is that `executesAsync` dispatches to the main queue asynchronously, causing `result` to be printed before, `result` is updated. The `executesSync` function dispatches to the main queue synchronously, which results in the execution of `executesSync` to be paused until the closure passed to `DispatchQueue.main.sync` finishes executing. This means that `result` is updated when `print` is called.

Think about the preceding example in the context of reloading a table view. If we would use `sync` instead of `async`, the executing of the network call completion closure is paused while the main thread reloads the table view. Once the table view is reloaded, the execution of the closure is resumed. By using `async`, the completion closure continues its execution and the table view will reload whenever the main queue has time to do so. This, hopefully, is pretty much instantaneously because if it takes a while it's probably a symptom of blocking the main thread.

## **Knowing when to use DispatchQueue.main**

Now that you know what the main queue is, and you've seen an example of how and when `DispatchQueue.main` is used, how do you know when you should use `DispatchQueue.main` in your project?

The simplest answer is to always use it when you're updating UI in a delegate method or completion closure because you don't control how or when that code is called. In addition, Xcode will crash your app if it detects that you're doing UI work away from the main thread. While this is a very convenient feature that has helped me prevent bugs every now and then, it's not reliable 100% of the time and there are better ways to make sure your code runs on the main thread when it has to.

Remember to always dispatch your queue to the main queue asynchronously using `DispatchQueue.main.async` to avoid blocking the current thread. And potentially even deadlocking your app, which can happen if you call `DispatchQueue.main.sync` from code that is already on the main queue. Dispatching to the main queue with `async` does not carry this same risk, even if you're already on the main queue.

Let's look at one last example. If you fetch a user's current push notification permissions or request their contacts, you know that operation runs asynchronously and it might take a while. If you want to update the UI in the completion closure that's used for these operations, it's best to explicitly make sure your UI updates are done on the main queue by wrapping your UI updates in a `DispatchQueue.main.async` block.

## **In Summary**

Writing applications that use multiple queues can be really complicated. As a general rule, keep in mind that the main queue is reserved for UI work. That doesn't mean that all non-UI work has to go off the main queue, but it does mean that all the UI work most be on the main queue and all other work can be somewhere else if you want it to be. For example, if you know an operation might take a while to complete.

In other words, the short answer to the question from the beginning of this article, you should use `DispatchQueue.main` to send UI related work from non-main queues to the main queue.
