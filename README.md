# **DEImageDepot**

## Formats
- Tagged Image File Format (TIFF)
- Joint Photographic Experts Group (JPEG)
- Graphic Interchange Format (GIF)
- Portable Network Graphic (PNG)
- Windows Bitmap Format (DIB)

## Integration

#### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `DECardNumberFormatter` by adding the proper description to your `Package.swift` file:

```swift
// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/Darkngs/DEImageDepot.git", from: "1.0.0"),
    ]
)
```
Then run `swift build` whenever you get prepared.

## Examples

#### Download image async
```swift
let exampleImageView = UIImageView()
...
let imagePath = "http://golyash.com/images/dec.jpg"
DEImageDepot.shared.image(withPath: imagePath) { [weak self] (image) in
    self?.exampleImageView.image = image
}
```

#### Clear depot
```
DEImageDepot.shared.clear()
```
