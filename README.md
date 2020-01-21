# **DEImageDepot**

## Formats
- Tagged Image File Format (TIFF)
- Joint Photographic Experts Group (JPEG)
- Graphic Interchange Format (GIF)
- Portable Network Graphic (PNG)
- Windows Bitmap Format (DIB)

## Examples

#### Download image async
```swift
let exampleImageView = UIImageView()
...
let imagePath = "http://golyash.com/images/dec.jpg"
ImageDepot.shared.image(withPath: imagePath) { [weak self] (image) in
    self?.exampleImageView.image = image
}
```

#### Clear depot
```
ImageDepot.shared.clear()
```
