# Advanced Concepts

## @escaping

Notes from https://www.donnywals.com/

If you've ever written or used a function that accepts a closure as one of its arguments, it's likely that you've encountered the @escaping keyword. When a closure is marked as escaping in Swift, it means that the closure will outlive, or leave the scope that you've passed it to.

```swift
func makeRequest(_ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
  URLSession.shared.dataTask(with: URL(string: "https://selvarajan.in")!) { data, response, error in
    if let error = error {
      completion(.failure(error))
    } else if let data = data, let response = response {
      completion(.success((data, response)))
    }

    assertionFailure("We should either have an error or data + response.")
  }
}
```

Notice that in the code above the completion closure is marked as @escaping. It has to be because I use it in the data task's completion handler. This means that the completion closure won't be executed until after makeRequest(\_:) has exited its scope and the closure outlives it.

In short, @escaping is used to inform callers of a function that takes a closure that the closure might be stored or otherwise outlive the scope of the receiving function. This means that the caller must take precautions against retain cycles and memory leaks. It also tells the Swift compiler that this is intentional.

## Weaf Self

[When to use Weak self and why. Read this article](/Swift/WeakSelf.md)
