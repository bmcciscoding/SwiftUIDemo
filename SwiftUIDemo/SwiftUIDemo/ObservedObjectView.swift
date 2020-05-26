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
    
@Environment(\.colorScheme)
var colorMode

var text: String {
    switch colorMode {
        case .light: return "light"
        case .dark: return "dark"
        @unknown default: return "unknow"
    }
}

    var body: some View {
        Text(text)
            .foregroundColor(Color("Lanse"))
            .background(Color.gray)
    }
    
    func viewDidAppear() {
        // Do something you want
    }
    
    func viewDidDisappear() {
        // Do something you want
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
static var previews: some View {
    ObservedObjectView(model: OOVModel.init())
        .environment(\.colorScheme, .dark)
}
}
