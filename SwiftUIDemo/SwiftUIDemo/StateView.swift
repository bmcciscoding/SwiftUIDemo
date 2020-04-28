//
//  StateView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/15.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

class StateViewModel: ObservableObject {
    @Published
    var show: Bool = false
}

struct StateSubView: View {
    
    
    @Binding
    var show: Bool
    
    var body: some View {
        Text(show ? "Show" : "Hide")
    }
}

struct StateView: View {
    
    @ObservedObject
    var vm = StateViewModel.init()
    
    var body: some View {
        StateSubView.init(show: $vm.show)
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
