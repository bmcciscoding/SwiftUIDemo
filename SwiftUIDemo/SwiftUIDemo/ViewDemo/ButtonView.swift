//
//  ButtonView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    
    var body: some View {
        List {
            Button.init("DefaultButtonStyle") {}.buttonStyle(DefaultButtonStyle())
            Button.init("PlainButtonStyle") {}.buttonStyle(PlainButtonStyle())
            Button.init("BorderlessButtonStyle") {}.buttonStyle(BorderlessButtonStyle())
            Button.init(action: {
                print("good")
            }) {
                Text("Text Label").foregroundColor(Color.yellow)
            }
            NavigationLink.init("NavigationLink", destination: Text("Hello"))
            VStack {
                Text("EditButton")
                EditButton()
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
