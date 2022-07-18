# XCode Tooling & Debudding

### Assistence

The assistence tab helps in viewing associated stuffs for the class file selected. Like related protocals, extentions, counterparts, test file etc

### Build Settings

1 Project → multiple targets, multiple configurations

![Project Targets](images/xt-project-target.png)

Build configuration = set of build settings used to build a target’s product in a particular way

### Configurations

The default set of configurations are `Debug, Release`

We can add additional configurations like adhoc, staging etc.

### iOS Code Signing

![Provisioning Profile](images/xt-prov-profile3.png)

**What is a build setting?**

A property you can apply to your Xcode targets to configure aspects of how they are built.

Managing build settings:

- Via Xcode Build Settings Editor
- Via Configuration Settings Files (.xcconfig)

![Build setting](images/xt-build-setting2.png)

### Sample settings with above levels:

![Build Setting](images/xt-build-setting3.png)

![Build Setting](images/xt-build-setting4.png)

### Xcodeproj structure

![Project Structure](images/xt-project-structure.png)

### Xcode support @ apple developer

[https://developer.apple.com/support/xcode](https://developer.apple.com/support/xcode)

![SDK Support](images/xt-sdk-support.png)

### Shortcuts

CMD + SHIFT + O - To open ‘Open Quickly’ search window.

---

# XCode debugging

### Debugging the stack trace

![stack-trace](images/xd-stack-trace.png)

Viewing the thread this way showcases all the stack trace path.. (OR) click on the first bottom icon in the navigator pane.

### LLDB Debugger

LLDB - is a Low Level Debugger. Xcode has this command line tool to manipulate the debugging process.

Commands:

- fr v (OR) frame variable
- help
- frame help
- expr println(bugs)
- expr self.bugs.removeAll()
- po bugs
- po self
- expr unsafeBitCast(0x7fb08e300360, UIImageView.self)
  ![unsafe-bitcast](images/xd-unsafe-bitcast.png)
- expr let $bug1 = unsafeBitCast(0x7fb08e300360, UIImageView.self)
expr println($bug1)
  ![lldb-print](images/xd-lldb-print1.png)
- expr $bug1.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
expr println($bug1)
  ![lldb-print](images/xd-lldb-print2.png)
- breakpoint set —file BugFactory.swift —line 26
- breakpoint set —selector viewDidLoad
  - This sets the breakpoint in all views` viewDidLoad method.. pretty useful
- breakpoint disable 2
- breakpoint list
- thread backtrace all

### Breakpoint Pane:

Here we can configure like only pass after the 10th bug or so..

- Goto breakpoints pane and right-click on the breakpoint to see various options

![breakpoint](images/xd-breakpoint1.png)

![breakpoint](images/xd-breakpoint2.png)

- Similarly there are many other options. For ex: ‘Action’ has other options to add sound when there is a bug or trigger another shell script when there is a bug.

**Resources:**

- [LLDB Quick Start Guide from Apple](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-command-examples.html#//apple_ref/doc/uid/TP40012917-CH3-SW1)
- More commands here - [https://lldb.llvm.org/use/tutorial.html](https://lldb.llvm.org/use/tutorial.html)
