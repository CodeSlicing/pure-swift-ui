<p align="center">
<img src="./Assets/Images/pure-swift-ui-logo.png" width="400" style="padding-bottom: 20px"/>
</p>

[PureSwiftUI][pure-swift-ui] is a Swift package designed to enhance the experience of writing [SwiftUI][swift-ui] code. An additional goal is to make these changes as intuitive as possible, requiring little to no experience with the package to begin using its advantages in ernest.

## Contents

- [Contents](#contents)
- [Motivation](#motivation)
- [TL;DR](#tldr)
- [Intention Focused Modifiers](#intention-focused-modifiers)
- [Type Coercion](#type-coercion)
- [Conditional Modifiers](#conditional-modifiers)
- [Conditional Rendering](#conditional-rendering)
- [SF Symbols](#sf-symbols)
- [Clip Shapes](#clip-shapes)
- [Caveats](#caveats)
- [Installation](#installation)
- [Versioning](#versioning)
- [Version History](#version-history)
- [Licensing](#licensing)
- [Contact](#contact)

## Motivation

We all love `SwiftUI`, and what the engineers at Apple have achieved is nothing short of ground-breaking. Often, however, a `View` can become cluttered with argument labels, type coercion, and various other aspects of day-to-day `View` creation that tend to get in the way of the design. With `SwiftUI` being a _design_ language as much as anything else, [PureSwiftUI][pure-swift-ui] was created to remove as much code external to intent as possible while retaining the expressiveness of the base API. As someone who exclusively writes views in code, a secondary consideration was to reduce the amount of typing as much as possible.

## TL;DR

To demonstrate some of the advantages, let's say you want to generate the following label:

<p align="center">
<img src="./Assets/Images/modifier-example-label.png" alt="Label with white text and a red background and rounded corners rotated slightly clockwise" title="label designed in SwiftUI"/>
</p>

The code below shows how you would generate this label, including a small offset, comparing the native `SwiftUI` code to that of [PureSwiftUI][pure-swift-ui].

```swift
//...

private let width: Double = 200
private let height: Int = 100
private let xOffset: Int = 10
private let yOffset: Double = 10
private let rotation: Int = 20
private let scale: Double = 1.1
private let opacity: Float = 0.9

//...

// original

Text("PureSwiftUI")
    .font(Font.title.bold())
    .foregroundColor(.white)
    .frame(width: CGFloat(width), height: height)
    .background(Color.red)
    .clipShape(Capsule())
    .rotationEffect(.degrees(Double(rotation)))
    .offset(x: CGFloat(xOffset), y: CGFloat(yOffset))
    .scaleEffect(CGFloat(scale))
    .opacity(Double(opacity))

// with PureSwiftUI

Text("PureSwiftUI")
    .title(.white, .bold)
    .frame(width, height)
    .backgroundColor(.red)
    .clipCapsule()
    .rotate(rotation.degrees)
    .offset(xOffset, yOffset)
    .scale(scale)
    .opacity(opacity)
```

As you can see the difference is dramatic, favouring design over implementation boiler-plate.

## Intention Focused Modifiers

As shown in the previous example, by removing many of the explicit [argument labels][swift-functions], the clarity of the code is increased. In most cases the modifier name is expressive enough to document the code without needing argument labels. Including them, in my opinion, only reduces readability.

Since these modifiers are used frequently by even casual coders, it's reasonable to assume that familiarity with how they behave is more than enough to bridge any reduction in auto-documentation.

For example, if you only want to set the width and offset something horizontally you would do this in `SwiftUI` natively:

```swift
.frame(width: 100)
.offset(x: 50)
```

With argument labels, about a third of this code could be considered _noise_. In addition, you're calling the `frame` modifier, but you only want to set the _width_. [PureSwiftUI][pure-swift-ui] tackles this in the following way:

```swift
.width(100)
.xOffset(50)
```

Another area that is improved is for components that don't expand to fill all available space by default; `Text` is a good example of this. Ordinarily you would achieve this like so:

```swift
Text("Some expanding text")
    .frame(maxWidth: .infinity, maxHeight: .infinity)
```

This is accomplished in the following way in [PureSwiftUI][pure-swift-ui]:

```swift
Text("Some expanding text")
    .greedyFrame() // or .greedyWidth / .greedyHeight
```

which I believe is a clearer expression of the intent.

## Type Coercion

Coercing variables can also lead to obfuscated design. In many common use-cases, with [PureSwiftUI][pure-swift-ui] you don’t have to worry about passing specifically typed parameters. As long as your variable is an `Int`, `Double`, `Float`, or `CGFloat`, you’re fine. In most cases you can mix types in the same modifier.

```swift
let width: Double = 200
let height = 100

//...

//original
.frame(width: CGFloat(width), height: CGFloat(height))

//PureSwiftUI
.frame(width, height)
```

## Conditional Modifiers

With liberal use of the ternary operator it is of course possible to conditionally style components based on the current state, but oftentimes the default value of the modifier is used as the _off_ state. In other words, keeping the default value as part of the display logic only serves to distract from the intent.

Consider the following example that sets the opacity of a component depending on whether or not it is disabled:

```swift
@State private var disabled = false

//...

.opacity(disabled ? 0.4 : 1)
```

Standard right? However, since the enabled state reverts to the default value for `opacity` this code explicitly includes a redundant `else` clause and is the semantic equivalent to the following:

```swift
if disabled {
    opacity = 0.4
} else {
    // do nothing
}
```

This isn't something we would reasonably do in non-`SwiftUI` code, and obscures the important part: that opacity is _only_ modified in the disabled state. [PureSwiftUI][pure-swift-ui] avoids this predicament by providing conditional modifiers, so the previous code-block would be written in this way:

```swift
@State private var disabled = false

//...

.opacityIf(disabled, 0.4)
```

We therefore avoid unnecessary references to default values and reduce friction to understanding the purpose of the code. It is also fully animatable, so you don't lose anything but baggage. In addition, since the `!` operator can be easy to miss, modifiers are provided for the negative case, like so:

```swift
@State private var enabled = false

//...

.opacityIfNot(enabled, 0.4)

// vs natively
.opacity(!enabled ? 0.4 : 1)

//or
.opacity(enabled ? 1 : 0.4)
```

There are a number of conditional modifiers to explore; just type `.if` and see what comes up.

## Conditional Rendering

`SwiftUI` of course allow you to render components using conditional logic, and that's fine. Nevertheless this also involves the use of a `Group` that isn't relevant to the purpose since we are forced to adhere to the opaque return type of `body`:

```swift
@State private var toggle = false

//...

// native
var body: some View {
    Group {
        if toggle {
            Text("It's true")
        } else {
            SFSymbol(.nosign)
        }
    }
}
```

The `Group` is not part of the design, but it has to be there - assuming we're not type-erasing our components. `RenderIf` on the other hand _is_ a `View`, so we can simply return it directly achieving the same result, like so:

```swift
@State private var toggle = false

//...

// using RenderIf
var body: some View {
    RenderIf(toggle) {
        Text("It's true")
    }.elseRender {
        SFSymbol(.nosign)
    }
}
```

Furthermore, since `RenderIf` is a `View`, modifiers can be applied directly to it and will affect whichever `View` is ultimately resolved. `RenderIf` can be used without the `else` clause if required, however at this point there is no support for `if else` clauses.

## SF Symbols

While SF symbols are a fantastic addition to the framework, none of us likes a stringly typed API, amirite? The process of finding the appropriate symbol using the [SF Symbols][sf-symbols] app and copying the appropriate string into your code is laborious, error-prone, and does not of course provide any type checking. There is also no way - just from looking at the code - of knowing which symbols are restricted in their usage without referring back to the SF Symbols app, or checking out the [SF Symbols Reference][sf-symbols-reference] guide.

Is the following symbol name correct, or restricted in any way?

```swift
Image(systemName: "pencil.circle")
```

Maybe; I'd have to check the documentation. Whereas with [PureSwiftUI][pure-swift-ui] the first question is moot, and the answer to the second question is clear:

```swift
SFSymbol(.pencil_circle)
SFSymbol(.🍏pencil_tip)

// or using an Image directly
Image(sfSymbol: .pencil_circle)
Image(sfSymbol: .🍏pencil_tip)
```

Since all SF symbols are available as constants, there is also the option of using fuzzy searching to find a symbol you like the look of in the preview without the need to leave Xcode.

## Clip Shapes

Now I realise that clipping a shape is no great hardship. However, providing dedicated modifiers for each shape also allows for the content to be matched to that shape. In other words by using a specific clip shape modifier you don't need to restrain the content in a separate step (This can be set to unconstrained if required).

So the following code achieves the same result:

```swift
// original
.clipShape(RoundedRectangle(cornerRadius: 10))
.contentShape(RoundedRectangle(cornerRadius: 10))

// with PureSwiftUI
.clipRoundedRectangle(10)
```

## Caveats

Although [PureSwiftUI][pure-swift-ui] exports `SwiftUI` - meaning you don't need to import `SwiftUI` at the top of your views for compilation - unfortunately at the time of writing previews do not work if you are not explicitly importing `SwiftUI`. Hopefully this will be addressed in a future release.

## Installation

The `pure-swift-ui` package can be found at:

<https://github.com/CodeSlicing/pure-swift-ui.git>

Instructions for installing swift packages can be found [here][swift-package-installation].

## Versioning

This project adheres to a [semantic versioning](https://semver.org) approach. I'm sure a lot will change after WW20, so that's probably when version 2.0.0+ will appear.

## Version History

- [1.0.0][tag-1.0.0] Commit initial code
- [1.1.0][tag-1.1.0] Update SFSymbols to latest version (1.1 (16))
- [1.2.0][tag-1.2.0] Add constants for preview device names and add support for SFSymbolName to UIImage
- [1.3.0][tag-1.3.0] Add deprecated SFSymbols with availability
- [1.4.0][tag-1.4.0] Add alignment to greedy modifiers and Image specific modifiers to SFSymbol
- [1.5.0][tag-1.5.0] Add numerous modifiers and conditional modifiers including hueRotation, GeometryProxy extensions, Shape specific modifiers, UIScreen and more
- [1.5.0][tag-1.5.0] Add image processing modifiers and associated conditionals - add convenience modifiers to Image and SFSymbol to perform resizing and aspect ratio modifiers in one step

## Licensing

This project is licensed under the MIT License - see [here][mit-licence] for details.

## Contact

You can contact me on Twitter [@CodeSlice][codeslice-twitter]. Happy to hear suggestions for improving the package, or feature suggestions. I've probably made a few boo boos along the way, so I'm open to course correction. I won't be open-sourcing the project for the moment since I simply don't have time to administer PRs at this point, though I do intend to do so in the future if there's enough interest.

<!---
 external links:
--->

[pure-swift-ui]: https://github.com/CodeSlicing/pure-swift-ui
[sf-symbols]: https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/
[sf-symbols-reference]: https://sfsymbols.com
[codeslice-twitter]: https://twitter.com/CodeSlice
[swift-ui]: https://developer.apple.com/xcode/swiftui/
[swift-functions]: https://docs.swift.org/swift-book/LanguageGuide/Functions.html
[swift-package-installation]: https://medium.com/better-programming/add-swift-package-dependency-to-an-ios-project-with-xcode-11-remote-local-public-private-3a7577fac6b2

<!---
version links:
--->

[tag-1.0.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.0.0
[tag-1.1.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.1.0
[tag-1.2.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.2.0
[tag-1.3.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.3.0
[tag-1.4.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.4.0
[tag-1.5.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.5.0
[tag-1.6.0]: https://github.com/CodeSlicing/pure-swift-ui/tree/1.6.0

<!---
 local docs:
--->

[mit-licence]: ./Assets/Docs/LICENCE.md
