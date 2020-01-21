# **DEImageDepot**

## Example
```swift
let exampleImageView = UIImageView()
let imagePath = ""
ImageDepot.shared.image(withPath: imagePath) { [weak self] (image) in
    self?.exampleImageView.image = image
}
```

## Clear depot
```
ImageDepot.shared.clear()
```
