# **DEImageDepot**

## Formats
- Tagged Image File Format (TIFF)
- Joint Photographic Experts Group (JPEG)
- Graphic Interchange Format (GIF)
- Portable Network Graphic (PNG)
- Windows Bitmap Format (DIB)

## Integration

#### Swift Package Manager

You can use the [Swift Package Manager](https://swift.org/package-manager) to install `DEImageDepot` by adding the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/Darkngs/DEImageDepot.git", from: "1.0.0"),
```

#### Manually

Alternatively you can directly add the DEImageDepot.swift source file to your project.

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
