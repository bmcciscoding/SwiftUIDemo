## 前言

2019 WWDC 上，SwiftUI 横空出世。苹果终于受不了自己 UIKit 的繁琐，Frame 面对复杂布局无力的表达。AutoLayout 拿又臭又长的裹脚布，推出了声明式 UI 框架：[SwiftUI](https://developer.apple.com/documentation/swiftui)。先说感受，简洁所以很清晰。但也有遗憾，背后实现不透明，有些效果实现很复杂。总之，学习 SwiftUI 的小技巧就是，忘记 UIKit，从零开始。

```swift
struct DemoView: View {
    var body: some View {
        TabView {
            UIView().tabItem {
                Text("UI")
            }
        }
    }
}
```

SwiftUI 把所以 UI 层，都抽象成一个 Tree。每一个 View，都是一个节点，一个 struct。如果这个 struct 改变，则会重新渲染。

```swift
Toggle.init("Swich", isOn: $isOn)
```

Toggle 类似 UISwitch。`$isOn` 即是数据绑定。之前需要通过 add value change 事件来同步这个数据。现在只需要 `$isOn` 就做到了，十分方便。

## View

在 SwiftUI 上可以看到很多 UIKit 的影子。Text、Image、Button 等等，使用也更加方便。而且可以通过绑定取代之前 UIControlEvent 等方式。之前一只吐槽 UIKit 的事件绑定繁琐，如今终于得到了简化。对于之前的属性设置，SwiftUI 是通过 ViewModifer 来设置的。
```Swift
Text(TextString)
    .foregroundColor(textColor ? Color(UIColor.systemGreen) : Color.black)
    .isItalic(self.$isItalic.wrappedValue)
    .strikethrough(self.isStrikethrough, color: Color.red)
    .underline(self.showUnderline, color: Color.blue)
    .kerning(self.kerning)
    .tracking(self.tracking)
    .baselineOffset(self.baselineOffset)
    .font(.system(size: size))
    .fontWeight(weight)
    .lineLimit(line)
    .allowsTightening(self.allowTight)
    .minimumScaleFactor(self.minumumScale)
    .truncationMode(self.truncationMode ? .head : .tail)
    .lineSpacing(self.lineSpace)
    .multilineTextAlignment(self.align ? .trailing : .leading)
```
好像稍微有些多，而且看文档，经常会看到 `No overview available.` 这令人绝望的字眼。也许是苹果希望开发者自己手写来加深印象吧。
虽然感觉 SwiftUI 已经支持了 90% 的 UI 设置，但是还有一些不尽人意。比如导航栏的外观配置依然那么复杂，不同的机型，不同的版本让人抓狂。如果你有好的方式，请告诉我。

### 单视图

像 Text、Image 这些，我都理解成单视图。独立就能作为一个 View。使用起来，需要注意数据绑定和各种定制的 ViewModifier。由于 ViewModifier 实在太多，只能孰能生巧。

### 容器视图

ScollView、ListView 都是容器视图，概念也和 UIKit 像是。但是 delegate 事件上，没有 UIKit 丰富。

### 结构视图

NavigationView 和 TabView 是两座大山。

### 图形

SwiftUI 内置了一些图形，也支持通过 Path 去自定义图形。支持拉伸，旋转，位置变换。

### 动画

SwiftUI 有提供默认动画。

## Layout

我认为 SwiftUI 布局还是相对复杂的。我更喜欢 flexbox 那样的概念。但是 SwiftUI 相似，但又很不相同。感觉内部自动实现了很多清空，导致开发者不能 100% 定制。

- frame
- padding
- overlay
- Stack
- Spaceer & Divider
- GeometryReader

## Data

SwiftUI 数据相关的概念有这些，理解起来十分清晰。

- State：内部属性
- Binding：外部属性
- ObserverdObject：集合属性
- Enviroment：全局属性

除此之外，还有一些概念需要理解

- id
- EquatableView
- AnyView

## 与 UIKit 交互

简单来说，在 SwiftUI 用 UIKit，则使用 UIViewRepresentable or UIViewControllerRepresentable。如果在 UIKit 使用 Swift，则使用 UIHostingController。

- UIViewRepresentable
- UIViewControllerRepresentable
- UIHostingController

## 注意

## 展望未来

期望 2020 的 WWDC 上，SwiftUI 更好。
