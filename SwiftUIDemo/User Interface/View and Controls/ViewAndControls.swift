//
//  ViewAndControls.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/9/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct ViewAndControls: View {
    
    @State
    var textFieldString: String = "This is a text field"
    
    @State
    var secureFieldString: String = "This is a text field"
    
    @State
    var textEditorString = "This is TextEditor"
    
    @State
    var showButtonTitle = false
    
    @State
    var showToggleTitle = false
    
    enum PickerValues: String, CaseIterable, Identifiable {
        case one
        case two
        case three
        
        var id: String { self.rawValue }
    }
    @State
    var pickerValues = PickerValues.one
    
    @State
    var date = Date()
    
    @State
    var sliderValue = 50.0
    
    @State
    var stepperValue = 1
    
    @State
    var colorValue = Color.red
    
    var body: some View {
        Form {
            
            Section.init(header: Text("Text")) {
                Text("This is a Text").background(Color.red)
                TextField.init("This isa TextField", text: $textFieldString).background(Color.yellow)
                SecureField.init("This is a SecureField", text: $secureFieldString).background(Color.blue)
                TextEditor.init(text: $textEditorString).background(Color.green)
                HStack {
                    Text("This").foregroundColor(Color.red)
                    Text("is").foregroundColor(Color.yellow)
                    Text("a").foregroundColor(Color.blue)
                    Text("Rich Text").foregroundColor(Color.green)
                }
            }
            Section.init(header: Text("Images")) {
                Image("test")
            }
            Section.init(header: Text("Buttons")) {
                Button.init(self.showButtonTitle ? "Show" : "Hide") {
                    self.showButtonTitle.toggle()
                }.buttonStyle(BorderlessButtonStyle())
                Menu {
                    Button.init("Button 1") {}
                    Button.init("Button 2") {}
                    Menu.init("Sub Menu Button") {
                        Button.init("Button 1") {}
                        Button.init("Button 2") {}
                    }
                } label: {
                    Text("Menu Button")
                }
            }
            Section.init(header: Text("Value Selectors")) {
                Toggle.init(self.showToggleTitle ? "Show" : "Hide", isOn: $showToggleTitle).toggleStyle(SwitchToggleStyle())
                Picker.init("Picker", selection: $pickerValues) {
//                    Text("One").tag(PickerValues.one)
//                    Text("Two").tag(PickerValues.two)
//                    Text("Three").tag(PickerValues.three)
                    
                    ForEach(PickerValues.allCases) { v in
                        Text(v.rawValue).tag(v)
                    }
                }
                DatePicker.init("Date", selection: $date)
                Slider.init(value: $sliderValue, in: 0...100, step: 1, onEditingChanged: { (ok) in
                    print(ok)
                }, minimumValueLabel: Text("0"), maximumValueLabel: Text("100")) {
                    Text("\(self.sliderValue)")
                }
                Stepper.init("Stepper \(self.stepperValue)", value: $stepperValue)
                ColorPicker.init("Color \(self.colorValue.description)", selection: $colorValue)
            }
        }
    }
}

struct ViewAndControls_Previews: PreviewProvider {
    static var previews: some View {
        ViewAndControls()
    }
}
