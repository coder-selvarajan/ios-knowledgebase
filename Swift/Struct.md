# Structs

Swift lets you design your own types in two ways, of which the most common are called structures, or just structs. Structs can be given their own variables and constants, and their own functions, then created and used however you want.

Variables inside structs are called *properties* or *Stored properties*

```swift
struct Sport {
	var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
```

## Computed Properties

Computed property is a property that runs code to figure out its value.

```swift
struct Sport {
	var name: String
	var isOlympicSport: Bool
	var olympicStatus: String {
		if isOlympicSport {
			return "\(name) is an Olympic sport"
		} else {
			return "\(name) is not an Olymphic sport"
		}
	}
}
```

## Property Observers

This let you run code before or after any property changes.

```swift
struct Progress {
	var task: String
	var amount: Int {
		didSet {
			print("\(task) is now \(amount)% complete")
		}
	}
}
```

Here `didSet` property observer will run code every time amount changes.

We can also use `willSet` to take action before the property changes.

## Methods

Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called *methods*

```swift
struct City {
	var population: Int
	func collectTaxes() -> Int {
		return population * 1000
	}
}
```

### Mutating Methods

If a struct has a variable property but the instance of the struct was created as a constant, that property can't be changed  - the struct is constant, so all its properties are also constant regardless of how they were created.  

The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift wont let you write methods that change properties unless you specifically request it.

When you want to change a property inside a method, you need to mark it using the mutating keyword.

```swift
struct Person {
	var name: String
	mutating func makeAnonymous() {
		name = "Anonymous"
	}
}

var person = Person(name: "Ed")
person.makeAnonymous()
```

## String (is a struct)

Strings are structs. They have their own methods and properties.

```swift
var string: String = "Do or do not, there is no try"
string.count
string.hasPrefix("Do")
string.uppercased()
string.sorted()
```

### Array (is a struct)

Arrays are also structs.

```swift
var toys = ["Woody"]
toys.count
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
toys.sorted()
toys.remove(at: 0)
```

## Initializers

Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer - this asks you to provide a value for each property when you create the struct.

We can provide our own initializer to replace the default one.

```swift
struct User {
	var username: String
	init() {
		username = "Anonymous"
		print("creating new user!")
	}
}
```

You dont write func before initializers, but you do need to make sure all properties have a value before the initializer ends.

### SELF

Inside methods you get a special contant called self, which points to whatever instance of the struct is currently being used. The *self* value is particularly useful when you create initializers that have the same parameter names as your property.

```swift
struct Person {
	var name: String
	init(name: String) {
		print("\(name) was born!")
		self.name = name
	}
}
```

## Lazy Properties

As a performance optimization, Swift lets you create some properties only when they are needed.

```swift
struct Person {
	var name: String
	lazy var familyTree = FamilyTree()
	init(name: String) {
		self.name = name
	}
}
var ed = Person(name: "Ed")
```

Swift will only create the FamilyTree struct when it's first accessed. So, if you want to see the "Creating family tree!" message, you need to access the property at least once.

```swift
ed.familyTree
```

## Static Properties and Methods

You can ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.

```swift
struct Student {
	static var classSize = 0
	var name: String
	init(name: String) {
		self.name = name
		Student.classSize += 1
	}
}
```

Because the `classSize` property belongs to the struct itself rather than instances of the struct, we need to read it using `Student.classSize`

## Access Control

Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly.

```swift
struct Person {
	private var id: String
	init(id: String) {
		self.id = id
	}
}
```

Now only methods inside Person can read the `id` property.

## Summary

1. You can create you own types using structures, which can have their own properties and methods
2. You can use stored properties or use computed properties to calculate values on the fly.
3. If you want to change a property inside a method, you must mark it as `mutating`.
4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
5. Use the `self` constant to refer to the current instance of a struct inside a method.
6. The `lazy` keyword tells Swift to create properties only when they are first used.
7. You can share properties and methods across all instances of a struct using the `static` keyword
8. Access control lets you restrict what code can use properties and methods
