//
//  LifeCycleView.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/4/30.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct LifeCycleView: View {
    var body: some View {
        List {
            ForEach(0..<20) { p in
                Text("\(p)").onAppear {
                    print("appear \(p)")
                }.onDisappear {
                    print("disappear \(p)")
                }
            }
        }
    }
}

struct LifeCycleView_Previews: PreviewProvider {
    static var previews: some View {
        LifeCycleView()
    }
}
