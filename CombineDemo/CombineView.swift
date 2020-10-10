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

class CombineViewModel {

    var text: String = ""

    init() {

        let pub = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let sinkSub = pub.sink { (complete) in
            print(complete)
        } receiveValue: { (no) in
            print(no)
        }
        
        let assginSub = pub.map { _ in "will show" }.assign(to: \CombineViewModel.text, on: self)


    }

}


struct CombineView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

        }
    }
}

struct CombineView_Previews: PreviewProvider {
    static var previews: some View {
        CombineView()
    }
}
