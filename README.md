# SwiftLogger
SwiftLogger provides the functionality to plot debugging traces through the console

## Requirements
- iOS 16.0+
- Xcode 15.0+
- Swift 5.0+

## Installation

### Swift Package Manager
in ```Package.swift``` add the following:

```
dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/Injector/SwiftLog.git", from: "1.0.0")
],
```

## Basic Usage

Most common levels are considered and ordered by descending logging info quantity. Every level has a static level that you can easily access
```
logger.debug("This is a debug message")
```

You can limit log visibility by setting output level.

```
Example: logger.setOutputLevel(.verbose)
```
