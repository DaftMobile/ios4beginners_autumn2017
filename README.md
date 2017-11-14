[![iOS 4 Beginners](https://user-images.githubusercontent.com/1230922/31862042-c045dba0-b737-11e7-98bf-e816ad04ad73.png)](https://github.com/DaftMobile/ios4beginners_2017)

![Platforms](https://img.shields.io/badge/platforms-iOS-blue.svg)
![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![Twitter Follow ](https://img.shields.io/twitter/follow/espadrine.svg?style=social&label=Follow)](https://twitter.com/mdab121)
[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?style=social&label=Follow)](https://twitter.com/DaftMobile)

# iOS 4 Beginners class – MiMUW 2017


## Classes

### Class 1: Hello Swift

We were talking about the basics of Swift programming language:

- Variables and **constants** (`var` and `let` keywords)
- `String`
- `Array` and `Dictionary` data types (value types)
- Optionals (`Int?`, `String?`, `if let ...` syntax, and so on)
- Control Flow (`if`, `for` and `while` loops, `switch` statement (💪))
- Functions – defining a function with parameters in Swift (`func` keyword), return value type, calling functions, etc.
- Classes – defining a basic class, defining methods, class properties, initializers. We've also discussed inheritance in Swift, overriding methods and initializers.

To learn more, go through the [Swift Basics](./Class%201) playground.

### Class 2: Intermediate Swift and Introduction to AutoLayout

We were talking about some more advanced concepts of Swift, including:

- Enums!
- Structs
- Value Types vs Reference Types
- Nested Types
- Memory management in Swift

To learn more, go through the [Swift Intermediate](./Class%202) playground.

We've also started to talk about AutoLayout and basic usage of Interfac Builder in XCode.

_Homework:_

See home assignment [here](Assignments/Assignment1/assignment1.md).

The solution to this assignment is available [here](Assignments/Assignment1/Solution).

### Class 3: iOS Design Patterns

We were talking about Model View Controller application architecture pattern. This approach is strongly recommended by Apple, including all UIKit API designs. You can read more about Apple's interpretation of MVC [here](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html). That's the design pattern that is the easiest to use and understand in small apps (like those we will build during this class).

In summary:

1. Separate your classes into three categories:
	- **Models**: The core of your app's logic. Your database, your business logic, your network requests, etc.
	- **Views**: The most generic and reusable objects here. A `UILabel` and a `UIButton` are views (most of views are subclass of `UIView`) - they don't know anything about what they're displaying or what actions they perform.
	- **Controllers**: Subclasses of `UIViewController`. Their responsibility is to display model data in the views, as well as handle user's actions and represent them to the model
2. Don't let **views** and **models** communicate! Ever! ✋🛑
3. Controllers should own their models.
4. Controllers should own their views.
5. Views communicate with their controllers by [**target-action**](https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html) mechanism, or by [**delegation**](https://developer.apple.com/library/content/documentation/General/Conceptual/CocoaEncyclopedia/DelegatesandDataSources/DelegatesandDataSources.html) (via `weak` variables and protocols).
6. Models communicate with controllers by notifications (see [`NotificationCenter`](https://developer.apple.com/documentation/foundation/notificationcenter)) (to inform about updates) or by completion [**closures**](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html).

###### Examples:
During this class we've built two sample apps. They both utilize the MVC approach, which works perfectly here. Check out our [Smile App](./Class%203/Smile), and our [Button Counter](./Class%203/ButtonCounter) app.

In case you're wondering if MVC is a real life example: in heavier apps like [RocketLuncher](https://itunes.apple.com/app/id1167572430) we use MVVM design pattern. It separates UI actions from model actions and model manipulation, which is very useful in bigger apps.

You can read all about *MVC*, *MVVM* and other iOS Design Patterns in [this great article](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52) by Bohdan Orlov.

### Class 4: Networking on iOS – basics

We've disussed two new Swift and Foundation concepts: [Error handling](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html) and threading using [DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue). As always – see more in our class Playgrounds.

Next we dove into iOS Networking APIs. Starting with a basic initializer of `Data`: `init(contentsOf url: URL) throws`, which is a _blocking_ API call (which means you musn't use it on the main thread!!). This call handles the URL request behind the scenes, but does it on the queue in which you make the call.

Next, we covered the most important iOS Networking class: `URLSession`. We talked about `URLSession` initialization process (using `URLSessionConfiguration`), as well as how to create data tasks with completion closure using a `URLSession`. Remember that `URLSession` handles threading on its own, so there's no need to use `DispatchQueue.global()` to make a URLSession task. However, remember that the completion closure is called **on the networking queue**, so you probably need a `DispatchQueue.main.async { }` there.

_Homework:_

See home assignment [here](Assignments/Assignment2/assignment2.md).

## Resources

- [Install Swift on Linux](https://swift.org/download/#releases) - we're using version `4.0`
- [Open Source Swift](https://swift.org)
- [Free Swift Book](https://itunes.apple.com/us/book/the-swift-programming-language/id881256329?mt=11)
- [iOS Documentation](https://developer.apple.com/documentation/)
- [Apple Development Videos](https://developer.apple.com/videos/)

## Contact

- [E-mail](mailto:michal.dabrowski+mimuw@daftcode.pl)
- [Twitter](https://twitter.com/mdab121)
