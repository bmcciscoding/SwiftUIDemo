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

    let pub = (1...5).publisher

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sub \(value)")
    }

    let sink = Subscribers.Sink<Int, Never>.init { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sink \(value)")
    }

    pub.receive(subscriber: sink)


}

func learnDeferred() {

    let pub = Deferred.init {
        return Just(3)
    }

    _ = pub.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print(value)
    }
}

func testShare() {
    let future = Future<Int, Error>.init { (promise) in
        //promise(.success(3))
        let date = Date()
        let ts = date.timeIntervalSince1970
        promise(.success(Int(ts)))
        promise(.failure(TestError.unknow))
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

    _ = future.sink { (complete) in
        print(complete)
    } receiveValue: { (value) in
        print("sub \(value)")
    }

}

struct CombineView: View {

    var body: some View {
        VStack {
            Text("Just").onTapGesture {
                testJust()
            }
            Text("Share").onTapGesture {
                testShare()
            }
            Text("Deferred").onTapGesture {
                learnDeferred()
            }
            Text("Cusom").onTapGesture {
                testCustom()
            }
        }
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView()
    }
}
