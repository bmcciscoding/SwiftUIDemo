//
//  ValueSelectorView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct ValueSelectorView: View {
    
    @State
    var toggleState: Bool = false
    
    var toggleText: String {
        return toggleState ? "on" : "off"
    }
    
    @State
    var pickerIndex = 0
    
    var pickerData = [1, 2, 3]
    
    @State
    var date: Date = Date.init()
    
    @State
    var sliderValue: CGFloat = 0
    
    @State
    var stepperValue = 0
        
    var body: some View {
        Form {
            Section(header: Text("Toggle")) {
                  Toggle.init("DefaultToggleStyle", isOn: $toggleState).toggleStyle(DefaultToggleStyle())
                  Toggle.init("SwitchToggleStyle", isOn: $toggleState).toggleStyle(SwitchToggleStyle())
              }
            Section(header: Text("Picker")) {
                Picker.init("In From", selection: $pickerIndex) {
                    ForEach(0..<self.pickerData.count) {
                        Text("\(self.pickerData[$0])")
                    }
                }.pickerStyle(DefaultPickerStyle())
                Picker.init("Picker", selection: $pickerIndex) {
                    ForEach(0..<self.pickerData.count) {
                        Text("\(self.pickerData[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                HStack {
                    Spacer().background(Color.red)
                    Picker.init("Label", selection: $pickerIndex) {
                        ForEach(0..<self.pickerData.count) {
                            Text("\(self.pickerData[$0])")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    Spacer().background(Color.red)
                }
                Picker.init(selection: $pickerIndex, label: EmptyView()) {
                    ForEach(0..<self.pickerData.count) {
                        Text("\(self.pickerData[$0])")
                    }
                }.pickerStyle(WheelPickerStyle())
            }
            Section(header: Text("DatePicker")) {
                DatePicker.init("Pick Date", selection: $date).datePickerStyle(DefaultDatePickerStyle())
                DatePicker.init("Pick Date", selection: $date).datePickerStyle(WheelDatePickerStyle())
            }
            Section(header: Text("Slider")) {
                HStack {
                    Text("\(self.sliderValue)")
                    Slider.init(value: $sliderValue)
                }
            }
            Section(header: Text("Stepper")) {
                Stepper.init("\(self.stepperValue)", value: $stepperValue)
            }
        }
    }
}

struct ValueSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ValueSelectorView()
    }
}
