//
//  StacksView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/24.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct StacksView: View {
    @State
    var stackIndex = 0
    
    var selection = ["HStack", "VStack", "ZStack"]
    
    @State
    var space = 0.0
    
    @State
    var alignIndex = 0
    
    var body: some View {
        Form {
            Picker.init("Stack", selection: $stackIndex) {
                ForEach(0..<self.selection.count) {
                    Text("\(self.selection[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            if stackIndex != 2 {
                HStack {
                    Text("Space \(String(format: "%0.2f", $space.wrappedValue))")
                    Slider.init(value: $space, in: -10...20)
                }
            }
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    if (self.stackIndex == 0) {
                        HStack(alignment: .center, spacing: space.cgfloat) {
                            Circle().fill(Color.red).frame(width: 150, height: 150, alignment: .center)
                            Rectangle().fill(Color.yellow).frame(width: 100, height: 100, alignment: .center)
                            Ellipse().fill(Color.green).frame(width: 50, height: 50, alignment: .center)
                        }
                    } else if (self.stackIndex == 1) {
                        VStack(alignment: .center, spacing: space.cgfloat) {
                            Circle().fill(Color.red).frame(width: 150, height: 150, alignment: .center)
                            Rectangle().fill(Color.yellow).frame(width: 100, height: 100, alignment: .center)
                            Ellipse().fill(Color.green).frame(width: 50, height: 50, alignment: .center)
                        }
                    } else if (self.stackIndex == 2) {
                        ZStack(alignment: .center) {
                            Circle().fill(Color.red).frame(width: 150, height: 150, alignment: .center)
                            Rectangle().fill(Color.yellow).frame(width: 100, height: 100, alignment: .center)
                            Ellipse().fill(Color.green).frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                }
                Spacer()
            }

        }
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        StacksView()
    }
}
