//
//  ObservedObjectView.swift
//  TomatoClock
//
//  Created by QiuPeng on 2020/4/13.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

class OOVModel: ObservableObject {
    @Published
    var value: Int = 0
}

struct ObservedObjectView: View {
    
    // 意味着 model 和 view 进行了绑定
    @ObservedObject 
    var model: OOVModel
    
    var body: some View {
        VStack {
            Text("修改 value 值，外面的 0 并不会变化")
            HStack {
                 Button.init("+") { 
                     self.model.value += 1
                 }
                 Text(self.model.value.description)
                 Button.init("-") { 
                     self.model.value -= 1
                 }
            }
        }
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView(model: OOVModel.init())
    }
}
