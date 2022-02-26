# Swift - Design Patterns

Design pattern is a proven solution to a common problem. 

Three types of design patterns

1. Creational
2. Structural
3. Behavioral

## Creational

### Singleton

Ensures a type has only one instance 

Use of Singleton - Access and manage a single resource

## Delegate Design Pattern

![Untitled](images/dp/Untitled.png)

**Solution**

![Untitled](images/dp/Untitled%201.png)

![Untitled](images/dp/Untitled%202.png)

**Protocol + Delegate Sample:**

![Untitled](images/dp/Untitled%203.png)

```swift
let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
```

![4755615A-0F44-4A72-9418-DCF4558FF219.jpeg](images/dp/4755615A-0F44-4A72-9418-DCF4558FF219.jpeg)

![3EBE414E-BF75-4A90-8DB8-758CDB070308.jpeg](images/dp/3EBE414E-BF75-4A90-8DB8-758CDB070308.jpeg)