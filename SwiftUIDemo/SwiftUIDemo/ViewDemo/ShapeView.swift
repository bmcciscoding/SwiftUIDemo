//
//  ShapeView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/23.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

let colors = Gradient.init(colors: [Color.red, Color.yellow, Color.blue, Color.green, Color.purple, Color.pink])
let Liner = LinearGradient.init(gradient: colors, startPoint: .leading, endPoint: .trailing)
let Angularr = AngularGradient.init(gradient: colors, center: .center)
let Radial = RadialGradient.init(gradient: colors, center: .center, startRadius: 0, endRadius: 50)

struct ShapeView: View {
    
    @State
    var scale: CGFloat = 1
    
    @State
    var rotate: Double = 0
    
    @State
    var x: CGFloat = 0
    
    @State
    var y: CGFloat = 0
            
    var body: some View {
        Form {
            Section(header: Text("Shape")) {
                HStack {
                    Text("Path")
                    Path.init { (path) in
                        let w: CGFloat = 100
                        let h: CGFloat = 20
                        path.move(to: CGPoint.init(x: 0, y: 0))
                        path.addLine(to: CGPoint.init(x: w/2, y: 2 * h))
                        path.addLine(to: CGPoint.init(x: w, y: 0))
                        path.addArc(center: CGPoint(x: w / 4 * 3, y: 0),
                                    radius: w / 4,
                                    startAngle: Angle(degrees: 0),
                                    endAngle: Angle(degrees: 180),
                                    clockwise: true)
                        path.addArc(center: CGPoint(x: w / 4, y: 0),
                                    radius: w / 4,
                                    startAngle: Angle(degrees: 0),
                                    endAngle: Angle(degrees: 180),
                                    clockwise: true)
                    }
                    .fill(Color.red)
                }
                HStack {
                    Text("Rectangle")
                    Rectangle()
                }
                HStack {
                    Text("Circle")
                    Circle()
                }
                HStack {
                    Text("Ellipse")
                    Ellipse()
                }
                HStack {
                    Text("Capsule")
                    Capsule()
                }

            }
            Section(header: Text("Style")) {
                HStack {
                    Text("Fill").layoutPriority(.greatestFiniteMagnitude)
                    Circle().fill(Color.red)
                    Circle().fill(Liner)
                    Circle().fill(Angularr)
                    Circle().fill(Radial)
                }.frame(height: 100)
                HStack {
                    Text("Stroke").layoutPriority(.greatestFiniteMagnitude)
                    Circle().stroke(Color.red, lineWidth: 2)
                    Circle().stroke(Angularr, lineWidth: 2)
                    Circle().stroke(style: StrokeStyle.init(lineWidth: 1, lineCap: .butt, lineJoin: .bevel, miterLimit: 1, dash: [1, 2], dashPhase: 1))
                }.frame(height: 80)
            }
            Section(header: Text("Transform")) {
                VStack {
                    HStack {
                        Text("Scale \(String.init(format: "%0.2f", $scale.wrappedValue))")
                        Slider.init(value: $scale, in: 0.5...4)
                        ScaledShape.init(shape: Circle(), scale: CGSize.init(width: scale, height: scale))
                    }
                }
                HStack {
                        Text("Rotate \(String.init(format: "%0.2f", $rotate.wrappedValue))")
                        Slider.init(value: $rotate, in: 0...180)
                        RotatedShape.init(shape: Rectangle(), angle: Angle.init(degrees: rotate))
                    }
                VStack {
                    Text("Translation")
                    HStack {
                        Text("X \(String.init(format: "%0.2f", $x.wrappedValue))")
                        Slider.init(value: $x, in: -100...100)
                    }
                    HStack {
                        Text("Y \(String.init(format: "%0.2f", $y.wrappedValue))")
                        Slider.init(value: $y, in: -100...100)
                    }
                    TransformedShape.init(shape: Circle(), transform: .init(translationX: x, y: y))
                        .fill(Color.yellow)
                        .background(Color.green)
                }
            }
            Section(header: Text("Geometry")) {
                Text("Learn SwiftUI")
                    .foregroundColor(Color.blue)
                    .bold()
                    .background(GeometryReader { proxy in
                        Path.init { (path) in
                            print(proxy)
                            let w = proxy.size.width
                            let h = proxy.size.height
                            path.move(to: CGPoint.init(x: 0, y: 0))
                            path.addLine(to: CGPoint.init(x: w/2, y: 2 * h))
                            path.addLine(to: CGPoint.init(x: w, y: 0))
                            path.addArc(center: CGPoint(x: w / 4 * 3, y: 0),
                                        radius: w / 4,
                                        startAngle: Angle(degrees: 0),
                                        endAngle: Angle(degrees: 180),
                                        clockwise: true)
                            path.addArc(center: CGPoint(x: w / 4, y: 0),
                                        radius: w / 4,
                                        startAngle: Angle(degrees: 0),
                                        endAngle: Angle(degrees: 180),
                                        clockwise: true)
                        }
                        .fill(Color.red)
                    })
            }
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
