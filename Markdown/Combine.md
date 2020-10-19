Combine 是 Apple 推出到异步事件处理框架，类似于RxSwift。

主要概念有两个：Publisher 和 Subscriber。简单来说，Publisher如何发出数据，Subscriber处理收到到数据。

已经有 Timer，Notification，URLSession，KVO 都支持 Publisher。

# Publisher

发布者可以传递元素给一个或者多个订阅者，这些订阅者的绑定的 Input 和 Failure 类型需要和发布定匹配。发布者通过实现 receive 方法来接收订阅者。

发布者可以理解为，如何发布数据。可以发布被被订阅，数据流，结束或错误哦。

Combine 给我们提供了以下Publisher:

1. Future：自定义个 promise，返回一个值然后结束，或者错误。例如可以用于网路请求

2. Just：直接发出一个值 

3. Deferred：每次订阅，都会新创建一个 publisher

4. Empty：不发送任何数据，直接结束

5. Fail：可以发送一次数据，然后报错，或者直接报错

6. Record：可以记录输入，之后再传给每一个订阅者

## 控制发布连接

通常使用像 sink 这样都订阅方式是，立即要求无限的元素，这可能会阻止你按照自己喜欢的方式设置发布者。当发布者有两个或更多的订阅者时，在你准备好之前就产生值的发布者也可能是一个问题。这种多订阅者的情况会产生一个竞赛条件：发布者可以在第二个订阅者存在之前就向第一个订阅者发送元素。

#### 如何自定一个Publisher

# Operator

操作符，可以理解成给 publisher 加上一些条件

**映射**

- scan：1 2 3 4 => ($0 + $1) => 1 3 6 10

- map：1 2 3 => ($0 + 5) => 6 7 8

- setFailureType：error1 => error2

**过滤**

- compactMap：1 2 nil 4 => 1 2 4

- filter：1 2 4 5 6 => (x > 4) => 5 6

- replaceEmpty：_ => 1

- replaceError：error => 1

- removeDuplicates：1 1 1 2 2 25 => 1 2 25

**减少**

- collect：1 2 3 4 5 6 => [1, 2] [3, 4] [5, 6]

- reduce: a b c => ($0 + $1) => abc

- ignoreOutput： 1 2 3 => finish

谢谢

#### 封装一个异步操作

用block的方式

```Swift
func performAsyncAction(completionHandler: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
        completionHandler()
    }
}
```

用 combine 改造

```Swift
func performAsyncActionAsFuture() -> Future <Void, Never> {
    return Future() { promise in
        DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
            promise(Result.success(()))
        }
    }
}
```

# Subject

## CurrentValueSubject
CurrentValueSubject 不像 `@Published` 那样会自动调用 objectWillChange，因此在和 SwiftUI 配合使用时，会很难受。
但是直接使用 `@Published` 时，因此通常会定义 Failure，无法直接 assigne。因此需要使用  replaceError 操作服来解决这个问题。

## PassthroughSubject

#### 实现一个 ViewModel

#### 参考

- [https://www.donnywals.com/understanding-combines-publishers-and-subscribers/](https://www.donnywals.com/understanding-combines-publishers-and-subscribers/)

- 

