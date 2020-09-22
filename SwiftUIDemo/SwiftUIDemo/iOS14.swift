//
//  iOS14.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/9/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct iOS14: View {
    var body: some View {
        NavigationView {
            Form {
                Section.init(header: Text("Essentials")) {
                    Text("App Structure and Behavior").push {
                        TextViews().navigationBarTitle("Text")
                    }
                }
                Section.init(header: Text("User Interface")) {
                    Text("Views and Controls").push {
                        TextViews().navigationBarTitle("Views and Controls")
                    }
                    Text("View Layout and Presentation").push {
                        TextViews().navigationBarTitle("View Layout and Presentation")
                    }
                    Text("Drawing and Animation").push {
                        TextViews().navigationBarTitle("Drawing and Animation")
                    }
                    Text("Framework Integration").push {
                        TextViews().navigationBarTitle("Framework Integration")
                    }
                }
                Section.init(header: Text("Data and Events")) {
                    Text("State and Data Flow").push {
                        TextViews().navigationBarTitle("State and Data Flow")
                    }
                    Text("Gestures").push {
                        TextViews().navigationBarTitle("Gestures")
                    }
                }
            }.navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}

struct iOS14_Previews: PreviewProvider {
    static var previews: some View {
        iOS14()
    }
}
