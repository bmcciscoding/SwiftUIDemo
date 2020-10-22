# SwiftUI Tips

圆角

```swift
struct RoundedEdge: ViewModifier {
    let width: CGFloat
    let color: Color
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.cornerRadius(cornerRadius - width)
            .padding(width)
            .background(color)
            .cornerRadius(cornerRadius)
    }
}
```

字体大小


加载更多
```swift
// 在列表视图的 appear 里加上判断
.onAppear {
  vm.loadmore(current: img)
}
// 根据 item 位置判断
func loadmore(current item: Model) {
  if item != lists.last {
    return
}
```