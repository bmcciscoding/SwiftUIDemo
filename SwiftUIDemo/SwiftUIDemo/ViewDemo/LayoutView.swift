//
//  LayoutView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/24.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

protocol FormatString {
    func saveFloat(_ count: Int) -> String
}

extension CGFloat: FormatString {}

extension FormatString where Self == CGFloat{
    
    func saveFloat(_ count: Int) -> String {
        let format = "%0.\(count)f"
        return String.init(format: format, self, count)
    }
    
    func saveOne() -> String {
        return self.saveFloat(1)
    }
}


struct LayoutParams {
    var w: String = ""
}

struct MyView: View {
    
    @Binding
    var value: Int
    
    var body: some View {
        print("change body \(self.value)")
        return Text("\(value)")
    }
}

struct LayoutView: View {
    
    @State
    var showSpacer = false
    
    @State
    var showDivider = false
    
    @State
    var ignoreSafeArea = false
    
    @State
    var lp:(
        w: CGFloat,
        h: CGFloat,
        offsetX: CGFloat,
        positionX: CGFloat,
        padding: CGFloat) = (100, 100, 0, 50, 0)
    
    @State
    var w: CGFloat = 0
    
    @State
    var b = false
    
    @State
    var value = 5
        
    var body: some View {
        return Form {
//            Section(header: Text("FixedSize")) {
//                VStack {
//                 Text("A single line of text, too long to fit in a box.")
//                    .background(Color.red)
//
//                    Text("A single line of text, too long to fit in a box.")
//                    .background(Color.blue)
//
//                    Text("A single line of text, too long to fit in a box.")
//                    .background(Color.green)
//                    .frame(minWidth: 20, idealWidth: 60, maxWidth: nil, minHeight: nil, idealHeight: nil
//                        , maxHeight: nil, alignment: .center)
//                }
//            }
            
            Section(header: Text("EmptyView & EquatableView")) {
                EmptyView()
                MyView.init(value: $value)
                EquatableView.init(content: Text("\(value)"))
                Button.init(b ? "on" : "off", action: {
                    self.value += 5
                })
            }
            
            Section(header: Text("Frame")) {
                HStack {
                    VStack {
                        HStack {
                            Text("Width \(lp.w.saveOne())")
                            Slider.init(value: $lp.w, in: 0...100)
                        }
                        HStack {
                            Text("Height \(lp.h.saveFloat(1))")
                            Slider.init(value: $lp.h, in: 0...100)
                        }
                        HStack {
                            Text("OffsetX \(lp.offsetX.saveFloat(1))")
                            Slider.init(value: $lp.offsetX, in: 0...100)
                        }
                        HStack {
                            Text("PositionX \(lp.positionX.saveFloat(1))")
                            Slider.init(value: $lp.positionX, in: 0...100)
                        }
                        HStack {
                            Text("Padding \(lp.padding.saveFloat(1))")
                            Slider.init(value: $lp.padding, in: 0...100)
                        }
                        HStack {
                            Text("Padding \(lp.padding.saveFloat(1))")
                        }
                        
                        Image("open")
                            .border(Color.red, width: 2)
                            .position(x: lp.positionX, y: 50)
                            .offset(x: lp.offsetX, y: 0)
                            .frame(width: lp.w, height: lp.h, alignment: .center)
                            .padding(lp.padding)
                            .background(Color.gray)
                    }
                }
            }
            
            Section(header: Text("Sapcer & Divider")) {
                VStack {
                    Toggle.init("\(self.showSpacer ? "show" : "hide") spacer", isOn: $showSpacer)
                    HStack {
                        Text("Space").background(Color.red)
                        if (self.showSpacer) {
                            Spacer()
                        }
                        Text("Space").background(Color.red)
                    }
                    Toggle.init("\(self.showDivider ? "show" : "hide") divider", isOn: $showDivider)
                    HStack {
                        Text("Space").background(Color.red)
                        if (self.showDivider) {
                            Divider()
                        }
                        Text("Space").background(Color.red)
                    }
                }
            }
            

            
            
        }
        .edgesIgnoringSafeArea(self.ignoreSafeArea ? .all : .init())
        .navigationBarItems(trailing: Button.init("Hide", action: {
            self.ignoreSafeArea.toggle()
        }))
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
