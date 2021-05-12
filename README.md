# Layouter

Layouter is a 100% Swift framework to apply auto-layout constraint rules to the views created by programmatically. 

It is an extension of UIView in order to make UI autolayout constraints easily.  

**Features**

* Easy to create autolayout rules


**Instalation**

Layouter only supports Swift Package Manager at the moment.

.package(url: "https://github.com/hsoysal/Layouter.git", .upToNextMajor(from: "1.0.0"))
To install Layouter using Swift Package Manager look for https://github.com/hsoysal/Layouter.git in Xcode (File/Swift Packages/Add Package Dependency...).

**Usage**

Native autolayout constraints: 
```swift
viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
viewContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
viewContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
viewContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
```

Layouter autolayout constraints:
```swift
viewContainer.fillDimension(offset: 10)
```

Native autolayout constraints: 
```swift
let safearea = view.safeAreaLayoutGuide
NSLayoutConstraint.activate([
    container.leadingAnchor.constraint(equalTo: container.superview!.leadingAnchor, constant: 30),
    container.topAnchor.constraint(equalTo: container.superview!.topAnchor, constant: 30),
    container.trailingAnchor.constraint(equalTo: container.superview!.trailingAnchor, constant: -30),
    container.bottomAnchor.constraint(equalTo: container.superview!.bottomAnchor, constant: -30),
])
NSLayoutConstraint.activate([
    topleft.leadingAnchor.constraint(equalTo: container.leadingAnchor),
    topleft.topAnchor.constraint(equalTo: container.topAnchor),
    topleft.widthAnchor.constraint(equalTo: topright.widthAnchor),
    topleft.heightAnchor.constraint(equalTo: topright.heightAnchor),
])
NSLayoutConstraint.activate([
    topright.leadingAnchor.constraint(equalTo: topleft.trailingAnchor),
    topright.topAnchor.constraint(equalTo: topleft.topAnchor),
    topright.trailingAnchor.constraint(equalTo: container.trailingAnchor),
])
NSLayoutConstraint.activate([
    bottomleft.leadingAnchor.constraint(equalTo: container.leadingAnchor),
    bottomleft.topAnchor.constraint(equalTo: topleft.bottomAnchor),
    bottomleft.widthAnchor.constraint(equalTo: bottomright.widthAnchor),
    bottomleft.heightAnchor.constraint(equalTo: topleft.heightAnchor),
    bottomleft.heightAnchor.constraint(equalTo: bottomright.heightAnchor),
    bottomleft.bottomAnchor.constraint(equalTo: container.bottomAnchor),
])
NSLayoutConstraint.activate([
    bottomright.leadingAnchor.constraint(equalTo: bottomleft.trailingAnchor),
    bottomright.topAnchor.constraint(equalTo: bottomleft.topAnchor),
    bottomright.trailingAnchor.constraint(equalTo: container.trailingAnchor)
])
```

Layouter autolayout constraints:
```swift
container.fillDimension(offset: 30)
topleft.top(offset: 0)
    .left(offset: 0)
    .equalWidths(with: topright)
    .equalHeights(with: topright)
    .alignTops(with: topright)
    .alignHorizontally(with: topright)
    .alignVertically(with: bottomleft)
    .equalHeights(with: bottomleft)
    
bottomleft.left(offset: 0)
    .bottom(offset: 0)
    .equalWidths(with: bottomright)
    .equalHeights(with: bottomright)
    .alignBottoms(with: bottomright)
    .alignHorizontally(with: bottomright)
    
topright.right(offset: 0)
bottomright.right(offset: 0)
```


* Alignments to superview

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.top = other.top + constant
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///   - location: location for the constraint. It can be `superview` or `safearea`.
///   The default is `superview`.
/// - Returns: `self`
func top(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.left = other.left + constant
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///
/// - Returns: `self`
@discardableResult
func left(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.right + constant = other.right
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///
/// - Returns: `self`
@discardableResult
func right(offset constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.bottom + constant = other.bottom
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///   - location: location for the constraint. It can be `superview` or `safearea`.
///   The default is `superview`.
/// - Returns: `self`
@discardableResult
func bottom(offset constant: CGFloat, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView
```


* Alignments to other views

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.top + constant = others.top
///
/// - Parameters:
///   - views: other views whose tops will be aligned with this view
///   - constant: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func alignTops(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.bottom = others.bottom + constant
///
/// - Parameters:
///   - views: other views whose bottoms will be aligned with this view
///   - constant: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func alignBottoms(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.left + constant = others.left
///
/// - Parameters:
///   - views: other views whose lefts will be aligned with this view
///   - constant: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func alignLefts(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.right = others.right + constant
///
/// - Parameters:
///   - views: other views whose rights will be aligned with this view
///   - constant: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func alignRights(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.trailing + constant = others.leading
///
/// - Parameters:
///   - views: other views who will be in the horizontal sequence starting with this view
///   - constant: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func alignHorizontally(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.bottom + constant= others.top
///
/// - Parameters:
///   - views: other views who will be in the vertical sequence starting with this view
///   - constant: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func alignVertically(with views: UIView..., constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView
```


* Sizing

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.width = constant
///
/// - Parameters:
///   - constant: constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func width(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.height = constant
///
/// - Parameters:
///   - constant: constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func height(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.width = constant
///     self.height = constant
///
/// - Parameters:
///   - constant: constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func size(equals constant: CGFloat, option: SizeOption = .equal(1000)) -> UIView  
```


* Equalities

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.width * multiplier + constant = others.width
///
/// - Parameters:
///   - views: other views whose width will be equal to this view
///   - multiplier: multiplier constant for the constraint.
///   - constant: constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func equalWidths(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.height * multiplier + constant = others.height
///
/// - Parameters:
///   - views: other views whose width will be equal to this view
///   - multiplier: multiplier constant for the constraint.
///   - constant: constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func equalHeights(with views: UIView..., multiplier: CGFloat = 1, constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```


* Filling

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.left = other.left + constant
///     self.right + constant = other.right
///
/// It calls the methods:
///
///     left(offset: constant, option: option)
///     right(offset: constant, option: option)
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func fillHorizontal(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.top = other.top + constant
///     self.bottom + constant = other.bottom
///
/// It calls the methods:
///
///     top(offset: constant, option: option, location: location)
///     bottom(offset: constant, option: option, to: location)
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///   - location: location for the constraint. It can be `superview` or `safearea`.
///   The default is `superview`.
/// - Returns: `self`
@discardableResult
func fillVertical(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.left = other.left + constant
///     self.right + constant = other.right
///     self.top = other.top + constant
///     self.bottom + constant = other.bottom
///
/// It calls the methods:
///
///     fillHorizontal(offset: constant, option: option)
///     fillVertical(offset: constant, option: option, location: location)
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///   - location: location for the constraint. It can be `superview` or `safearea`.
///   The default is `superview`.
/// - Returns: `self`
@discardableResult
func fillDimension(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView 
```


* Center

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.center = superview.center + constant
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
/// - Returns: `self`
@discardableResult
func centerHorizontally(offset constant: CGFloat = 0, option: SizeOption = .equal(1000)) -> UIView 
```

```swift
/// Returns self
///
/// Produces an active constraint of the form:
///
///     self.center = other.center + constant
///
/// - Parameters:
///   - offset: offset constant for the constraint.
///   - option: size option for the constraint. It can be `equal`, `equalOrGrater`, or `equalOrless`.
///   The default is `equal(1000)`.
///   - location: location for the constraint. It can be `superview` or `safearea`.
///   The default is `superview`.
/// - Returns: `self`
@discardableResult
func centerVertically(offset constant: CGFloat = 0, option: SizeOption = .equal(1000), location: Where = .superview) -> UIView  
```
