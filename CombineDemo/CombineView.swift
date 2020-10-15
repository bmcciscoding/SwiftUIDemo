//
//  CombineView.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/10/10.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

func asyncAction() -> Future<Int, Never> {
    return Future.init { (promise) in
        promise(.success(3))
    }
}

class CombineViewModel {

    var text: String = ""

    init() {





    }

}


enum TestError: Error {
    case unknow
}

class CustomSbucriber: Subscriber {

    func receive(subscription: Subscription) {
        print(subscription)
        subscription.request(.max(3))
    }

    func receive(_ input: Int) -> Subscribers.Demand {
        print(input)
        return .none
    }

    func receive(completion: Subscribers.Completion<Never>) {
        print(completion)
    }

    typealias Input = Int
    typealias Failure = Never

}

func testCustom() {
    let pub = (1...5).publisher
    let sub = CustomSbucriber.init()
    pub.receive(subscriber: sub)
}

func testJust() {

    let pub = Just(Date().timeIntervalSince1970)

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sub \(value)")
    }

    let sink = Subscribers.Sink<Double, Never>.init { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sink \(value)")
    }

    pub.receive(subscriber: sink)


}

func learnDeferred() {
    let pub = Deferred.init {
        return Just(Date().timeIntervalSince1970)
    }

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }
}

func testShare() {
    let future = Future<Int, Error>.init { (promise) in
        promise(.success(3))
    }.share()

    _ = future.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sub \(value)")
    }

    _ = future.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sub \(value)")
    }

    _ = future.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sub \(value)")
    }

}

func learnSequence() {
    let pub = (1...3).publisher
    sub3times(pub: pub.eraseToAnyPublisher())
}

func learnRecord() {
    let pub = Record<Int, Never>.init(output: [1, 2, 3], completion: .finished)
    sub3times(pub: pub.eraseToAnyPublisher())
}

func sub3times<T>(pub: AnyPublisher<T, Never>) {
    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }
}

func learnConnectablePublisher() {

}

struct CombineView: View {

    @State var curText = "xx"

    var body: some View {
        Form {
            Section.init(header: Text("Publisher")) {
                Text("Just").onTapGesture {
                    testJust()
                }
                Text("Share").onTapGesture {
                    testShare()
                }
                Text("Deferred").onTapGesture {
                    learnDeferred()
                }
                Text("Sequence").onTapGesture {
                    learnSequence()
                }
                Text("Record").onTapGesture {
                    learnRecord()
                }
                Text("ConnectablePublisher").onTapGesture {
                    let pub = Just(1).share().makeConnectable()
                }
            }
            Section.init(header: Text("Subscriber")) {
                Text("\(curText)").onReceive(Just(3).delay(for: 3, scheduler: DispatchQueue.main)) { (output) in
                    self.curText = "\(output)"
                }
            }

//            Text("Cusom").onTapGesture {
//                testCustom()
//            }

        }
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView()
    }
}
