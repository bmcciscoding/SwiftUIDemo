//
//  AnimationView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/24.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

extension Double {
    var cgfloat: CGFloat {
        return CGFloat(self)
    }
}

struct AnimationView: View {
    
    
    @State
    var isOn = false
        
    var x: Double {
        return self.isOn ? 100 : -100
    }
    
    @State
    var showMore = false
        
    var body: some View {
        Form {
            Section(header: Text("Add Animations to Individual Views")) {
                Toggle.init(isOn: $isOn) {
                    Text("Animaiton \(isOn ? "on" : "off")").foregroundColor(Color.pink)
                }
                HStack {
                    Text("default").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(.default)
                }
                HStack {
                    Text("easeInOut").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(.easeInOut)
                }
                HStack {
                    Text("easeIn").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(.easeIn)
                }
                HStack {
                    Text("easeOut").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(.easeOut)
                }
                HStack {
                    Text("linear").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(.linear)
                }
                HStack {
                    Text("spring").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(.spring(response: 2, dampingFraction: 2, blendDuration: 2))
                }
                HStack {
                    Text("delay").multilineTextAlignment(.trailing).frame(width: 100)
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat).animation(Animation.linear(duration: 2).delay(0.5))
                }
            }
            Section(header: Text("Animate the Effects of State Changes")) {
                Button(action: {
                    withAnimation(Animation.default.speed(0.5)) {
                        self.isOn.toggle()
                    }
                }) {
                    Circle().offset(x: x.cgfloat, y: 0.0.cgfloat)
                }
            }
            Section(header: Text("Customize View Transitions")) {
                Button(action: {
                    withAnimation(.spring()) {
                        self.showMore.toggle()
                    }
                }) {
                    HStack {
                        Text("\(showMore ? "show" : "hide") more").animation(nil)
                        Image(systemName: "chevron.right.circle").font(.system(size: 25)).rotationEffect(.degrees(showMore ? 0 : 90))
                        // Text("Learn SwiftUI").transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
                        if self.showMore {
                            Text("Learn SwiftUI").transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
                        }
                    }
                }

            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
