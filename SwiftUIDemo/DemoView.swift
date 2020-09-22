//
//  DemoView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/21.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        TabView {
            iOS14().tabItem {
                Text("SwiftUI")
            }
            UIView().tabItem {
                Text("UI")
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
