//
//  TextView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/21.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

let TextString = """
A text view always uses exactly the amount of space it needs to display its rendered contents, but you can affect the view’s layout. For example, you can use the frame(width:height:alignment:) modifier to propose specific dimensions to the view. If the view accepts the proposal but the text doesn’t fit into the available space, the view uses a combination of wrapping, tightening, scaling, and truncation to make it fit. With a width of 100 points but no constraint on the height, a text view might wrap a long string:
"""

extension Text {
    func isItalic(_ isItalic: Bool) -> Text {
        return isItalic ? self.italic() : self
    }
}


struct TextView: View {
    
    @State
    var size: CGFloat = 24
    @State
    var weightIndex = 0
    var weight: Font.Weight {
        return self.weights[self.weightIndex]
    }
    
    let weights: [Font.Weight] = [
        .ultraLight,
        .thin,
        .light,
        .regular,
        .medium,
        .semibold,
        .heavy,
        .bold,
        .black,
    ]
    
    let weightsString = [
        "ultraLight",
        "thin",
        "light",
        "regular",
        "medium",
        "semibold",
        "bold",
        "heavy",
        "black"
    ]
    

    @State
    var textColor = false
    @State
    var isItalic = false
    @State
    var isStrikethrough = false
    @State
    var showUnderline = false
    @State
    var kerning: CGFloat = 0 // a - b - c - d 字符之间的距离
    @State
    var tracking: CGFloat = 0 // adcd 整个单词的距离
    @State
    var baselineOffset: CGFloat = 0
    
    @State
    var allowTight: Bool = false
    @State
    var minumumScale: CGFloat = 1
    @State
    var truncationMode: Bool = false
    
    var minumumScaleString: CGFloat {
        return self.minumumScale
    }
    
    @State
    var line: Int = 3
    @State
    var lineSpace: CGFloat = 0
    @State
    var align: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Spacer()
                Text(TextString)
                    .foregroundColor(textColor ? Color(UIColor.systemGreen) : Color.black)
                    .isItalic(self.$isItalic.wrappedValue)
                    .strikethrough(self.isStrikethrough, color: Color.red)
                    .underline(self.showUnderline, color: Color.blue)
                    .kerning(self.kerning)
                    .tracking(self.tracking)
                    .baselineOffset(self.baselineOffset)
                    .font(.system(size: size))
                    .fontWeight(weight)
                    .lineLimit(line)
                    .allowsTightening(self.allowTight)
                    .minimumScaleFactor(self.minumumScale)
                    .truncationMode(self.truncationMode ? .head : .tail)
                    .lineSpacing(self.lineSpace)
                    .multilineTextAlignment(self.align ? .trailing : .leading)
                Spacer()
            }.frame(height: 150)
            Form {
                Section.init(header: Text("Choosing a Font")) {
                    Stepper.init("Size: \(Int(size))", value: $size)
                    Stepper.init(onIncrement: addWeight, onDecrement: minusWeight) {
                        Text("Weight \(self.weightsString[weightIndex])")
                    }
                }
                Section.init(header: Text("Sytling he Views' Text")) {
                    Toggle.init("ForegroundColor: \(textColor ? "on" : "off")", isOn: $textColor)
                    Toggle.init("Italic: \(isItalic ? "on" : "off")", isOn: $isItalic)
                    Toggle.init("Strikethrough: \(isStrikethrough ? "on" : "off")", isOn: $isStrikethrough)
                    Toggle.init("Underline: \(showUnderline ? "on" : "off")", isOn: $showUnderline)
                    Stepper.init("Kerning: \(Int(kerning))", value: $kerning)
                    Stepper.init("Tracking: \(Int(tracking))", value: $tracking)
                    Stepper.init("BaselineOffset: \(Int(baselineOffset))", value: $baselineOffset)
                }
                Section.init(header: Text("Fitting Text into Available Space")) {
                    Toggle.init("AllowTightening: \(allowTight ? "on" : "off")", isOn: $allowTight)
                    Stepper.init(onIncrement: addScale, onDecrement: minusScale) {
                        Text("MinimumScaleFactor: \(String.init(format: "%0.2f", self.minumumScaleString))")
                    }
                    Toggle.init("TruncationMode: \(truncationMode ? "on" : "off")", isOn: $truncationMode)
                }
                Section.init(header: Text("Handing Multiline Text")) {
                    Stepper.init("LineLimit: \(Int(line))", value: $line)
                    Stepper.init("LineSpace: \(Int(lineSpace))", value: $lineSpace)
                    Toggle.init("Align: \(align ? "trailing" : "leading")", isOn: $align)
                }
            }
        }
    }
    
    func addWeight() {
        if (self.weightIndex + 1 >= self.weights.count) {
            self.weightIndex = 0
        } else {
            self.weightIndex += 1
        }
    }
    
    func minusWeight() {
        if (self.weightIndex - 1 < 0) {
            self.weightIndex = self.weights.count - 1
        } else {
            self.weightIndex -= 1
        }
    }
    
    func addScale() {
        self.minumumScale += 0.05
    }
    
    func minusScale() {
        self.minumumScale -= 0.05
    }
}


struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
