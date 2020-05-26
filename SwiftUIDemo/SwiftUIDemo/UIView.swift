//
//  UIView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/21.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct Navigation<T: View>: ViewModifier {
    
    var to: T
 
    func body(content: Content) -> some View {
        return NavigationLink.init(destination: to) {
            content
        }
    }
}

extension View {
    func push<T: View>(to: T) -> some View {
        self.modifier(Navigation.init(to: to))
    }
    
    func push<T: View>(@ViewBuilder to: () -> T) -> some View {
        self.modifier(Navigation.init(to: to()))
    }
}


struct UIView: View {
    var body: some View {
        NavigationView {
            Form {
                Section.init(header: Text("Life Cycle")) {
                    Text("Life Cycle").push {
                        LifeCycleView().navigationBarTitle("Life Cycle")
                    }
                }
                Section.init(header: Text("Framework Integration")) {
                    Text("UIViewRepresentable").push {
                        FrameworkView().navigationBarTitle("Framework Integration")
                    }
                }
                Section.init(header: Text("View and Controls")) {
                    Text("Text").push {
                        TextView().navigationBarTitle("Text")
                    }
                    Text("Field").push {
                        FieldView().navigationBarTitle("Field")
                    }
                    Text("Image").push {
                        ImageView().navigationBarTitle("Image")
                    }
                    Text("Button").push {
                        ButtonView().navigationBarTitle("Button")
                    }
                    Text("Value Selectors").push {
                        ValueSelectorView().navigationBarTitle("Value Selectors")
                    }
                    Text("EmpytView & AnyView").push {
                        ValueSelectorView().navigationBarTitle("Value Selectors")
                    }
                    Text("Color")
                    Text("Alert")
                    Text("List")
                }
                Section(header: Text("Drawing and Animation")) {
                    Text("Shape").push {
                        ShapeView().navigationBarTitle("Shape")
                    }
                    Text("Animation").push {
                        AnimationView().navigationBarTitle("Animation")
                    }
                }
                Section.init(header: Text("View Layout and Presentation")) {
                    Text("Stacks").push {
                        StacksView().navigationBarTitle("Stacks")
                    }
                    Text("Lists and Scroll Views").push() {
                        ListScrollView().navigationBarTitle("Lists and Scroll Views")
                    }
                    Text("Layout").push(to: {
                        LayoutView().navigationBarTitle("Layout")
                    })
                    Text("Padding").push(to: Text("Link"))
                    Text("Spacer")
                }
            }.navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}

struct UIView_Previews: PreviewProvider {
    static var previews: some View {
        UIView()
    }
}
