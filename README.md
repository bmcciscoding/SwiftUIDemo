# SwiftUIDemo

这个 Repo 是我记录学习 SwiftUI 的 Demo 工程。因为苹果的官方文档有太多 No Overview Availabe，体验是在太差，所以我决定做一个 SwiftUI 手册。方便查询。

![](https://tva1.sinaimg.cn/large/007S8ZIlgy1ge9kxrtsysj30dd0lz41m.jpg)
![](https://tva1.sinaimg.cn/large/007S8ZIlgy1ge9kzq1827j30dd0lz0wt.jpg)

## 前言

2019 WWDC 上，SwiftUI 横空出世。苹果终于受不了自己 UIKit 的繁琐，Frame 面对复杂布局无力的表达。AutoLayout 拿又臭又长的裹脚布，推出了声明式 UI 框架：[SwiftUI](https://developer.apple.com/documentation/swiftui)。先说感受，简洁所以很清晰。但也有遗憾，背后实现不透明，有些效果实现很复杂。总之，学习 SwiftUI 的小技巧就是，忘记 UIKit，从零开始。

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


## Layout

## Data

## 注意

## 展望未来
