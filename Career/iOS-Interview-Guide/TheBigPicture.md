# The iOS Interview Guide

## The Big picture

If you build enough apps you’ll start noticing patterns. You’ll see that there are things you do over and over again in one form or another that are essentially the same. When that happens, you realize how all apps are similar to each other. Sure they might differ in looks and what they do for the user, but overall, the way you build them is the same. Therefore when developers are interviewed for any iOS position, they will be asked a similar set of questions revolving around broad iOS topics. The main idea is that interviewers need to figure out what you know about building iOS apps.

In this chapter, we’ll look at what iOS apps are, where they fit in the iOS system, the big picture design patterns that emerge out of building iOS apps, and how you can group and structure interview questions around those topics to systematize your own learning.

### **What is an iOS application and where does your code fit into it?**

If you think about it long enough, your typical iOS application is just a giant glorified run loop. It waits for user input and gets interrupted by external signals such as phone calls, push notifications, home button press, and other app life cycle events.

Following is Apple’s diagram of the iOS app life cycle:

<img src="images-iv-guide/run-loop.png" width="40%">

**UIApplication** is just an object built around the **main()** loop to augment it and give us more usability that calls convenient callbacks to your **UIAppDelegate** subclass. Those “convenient” callback methods would be:

- **application:willFinishLaunchingWithOptions:**
- **application:didFinishLaunchingWithOptions:**
- **applicationDidBecomeActive:**
- **applicationDidEnterBackground:**
- **applicationWillResignActive:**
- **applicationWillEnterForeground:**

What you actually do as an iOS app developer is just plug into those callbacks to run your application’s code and business logic. As soon as you understand that, you will realize where the line is drawn between your app and **Cocoa Touch** code. It is an important distinction to make.

A brand new project’s **AppDelegate** would look like this:

```swift
import UIKit //@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
        [NSObject: AnyObject]?) -> Bool
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateInitialViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
				return true
		}
    func applicationWillResignActive(application: UIApplication) {
        print("applicationWillResignActive")
		}
    func applicationDidEnterBackground(application: UIApplication) {
        print("applicationDidEnterBackground")
		}
    func applicationWillEnterForeground(application: UIApplication) {
        print("applicationWillEnterForeground")
		}
    func applicationDidBecomeActive(application: UIApplication) {
        print("applicationDidBecomeActive")
		}
    func applicationWillTerminate(application: UIApplication) {
        print("applicationWillTerminate")
		}
}
```

It is very typical to have something like that where you’d either use a storyboard or create an initial view controller in code. But at the end of the day, what happens is that you create a **UIWindow** to be the main window of the UI of your application and then you create the first view controller that is going to be displayed to the user.

To the iOS system, your app is yet another building block, yet another run/main loop that can be launched on user demand or when some other event in the system like push notification or location change happens.

## Patterns and Layers

After you build a few iOS applications of various complexities, one thing you might start to notice is that there are distinct layers of responsibility in each app’s codebase. Regardless of the application the common things would be: HTTP networking, storing data to disk, location GPS work, JSON parsing, data serialization, UI composition, resources and objects coordination, and other tasks.

All of those things in your code can by grouped into the following layers of responsibility: **storage layer**,**service layer**,**business logic layer**, and **UI layer**.

### Storage Layer

The main responsibility of this layer is to store data for your application and play the role of the **“ultimate source of truth”** for the rest of your code. Examples of what goes into this layer could be the following: **Core Data**, **Realm**, **NSUserDefaults**, **KeyChain**, **Disk File storage**, and
**in-memory arrays and dictionaries/sets**.

### Service Layer

This layer is responsible for all things involving networking and external communication. That could be, an HTTP client and a set of accompanying objects that do networking for the app and connect with the backend JSON API. Or it could be a Bluetooth Low Energy (BLE) client wrapper code that helps your app communicate and send or receive data from external Bluetooth devices. Or it could be a socket connection code. Or it could be a location service that connects with a device’s GPS delegates and gets location change updates.

The bottom line is that it’s the code that knows how to work with external interfaces, whether it’s HTTP or BLE or something else. Also quite often data serialization and mapping (let’s say from JSON to your custom objects) are included in this layer as well.

### UI Layer

The UI layer is responsible for drawing things on the screen. This is all the stuff that naturally goes into that bucket like UIView subclasses, Autolayout, Table Views, Buttons, Collection Views, and Bar Buttons.

Two other things that also belong to this layer that might not be obvious are View Controllers and View Models. View Controllers are suppose to do just that, control the view. View Models are complimentary objects that help with decluttering and decoupling views from other layers of responsibility. Remember the key to a happy and healthy iOS codebase is a skinny controller.

### Business Logic Layer

In this layer are objects that are responsible for the actual application’s business logic, objects that use components of other layers to achieve results and do the work for the user.

An example of what goes into this layer could be a manager object that takes care of token encryption and saving to keychain using keychain storage and some kind of encryption service in it.

The main idea is that this layer helps us keep services, storages, and other layers decoupled from each other and tell them (aka orchestrate and coordinate) what to do to achieve results. This layer is what actually makes your application useful.

Overview:

![Layers Overview](images-iv-guide/layer-overview.png)
