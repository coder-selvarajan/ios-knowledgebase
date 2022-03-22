# Core Data - Part 2

Lessons learned from CWC course

Encoding Decoding between json and objects:

![Untitled](images/core-data2/Untitled.png)

![Untitled](images/core-data2/Untitled%201.png)

In order to store the data then the objects have to subclass the NSManagedObject class

![Untitled](images/core-data2/Untitled%202.png)

## Core Data Steps:

1. You define your entities and attributes in the Core Data model
2. You generate your classes from the Core Data model
3. You get a reference to the Core Data persistent container
4. From the persistent container, you get a managed object context
5. Through that managed object context, you can create objects and store them in Core data for retrieval for later user.

### PersistenceContainer - Define with Singleton pattern

```Swift
struct PersistenceController {
    static let shared = PersistenceController()

    let container: PersistenceContainer
    private init() {
        container = NSPersistenceContainer(name: "Core_data_model")
        container.loadPersistentStores(...) { ... }
        ..
        ..
    }
}
```

### Accessing ManagedObject Context

```Swift
let a = PersistenceController.shared.container.viewContext
```

#### Adding the ManagedObjectContext to the environment

```Swift
@main
struct Core_Date_Demo: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//accessing the managedobjectcontext in other views via environment
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    ...
    ...
}
```
