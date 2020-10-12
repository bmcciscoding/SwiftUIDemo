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
                        ViewAndControls().navigationBarTitle("Text")
                    }
                }
                Section.init(header: Text("User Interface")) {
                    Text("Views and Controls").push {
                        ViewAndControls().navigationBarTitle("Views and Controls")
                    }
                    Text("View Layout and Presentation").push {
                        ViewAndControls().navigationBarTitle("View Layout and Presentation")
                    }
                    Text("Drawing and Animation").push {
                        ViewAndControls().navigationBarTitle("Drawing and Animation")
                    }
                    Text("Framework Integration").push {
                        FrameworkView().navigationBarTitle("Framework Integration")
                    }
                }
                Section.init(header: Text("Data and Events")) {
                    Text("State and Data Flow").push {
                        ViewAndControls().navigationBarTitle("State and Data Flow")
                    }
                    Text("Gestures").push {
                        ViewAndControls().navigationBarTitle("Gestures")
                    }
                }
                Section.init(header: Text("Combine")) {
                    Text("Publisher").push {
                        CombineView().navigationBarTitle("State and Data Flow")
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
