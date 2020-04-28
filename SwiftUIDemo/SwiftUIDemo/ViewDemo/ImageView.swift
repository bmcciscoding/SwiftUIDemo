//
//  ImageView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    
    @State
    var showPicker = false
    
    @State
    var selectImg: UIImage?
    
    @State
    var image: Image?
    
    @State
    var w: CGFloat = 100
    @State
    var h: CGFloat = 100
    @State
    var mode = 0
    var modes = ["Fit", "Fill"]
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .aspectRatio(CGSize.init(width: w, height: h), contentMode: mode == 0 ? .fit : .fill)
                .frame(width: w, height: h, alignment: .center)
                .background(Color.blue)
            Form {
                Section.init(header: Text("图片")) {
                    Slider.init(value: $w, in: 40...200,
                                minimumValueLabel: Text("40"),
                                maximumValueLabel: Text("200")) {
                        EmptyView()
                    }
                    Slider.init(value: $h,
                                in: 40...200,
                                minimumValueLabel: Text("40"),
                                maximumValueLabel: Text("200")) {
                        EmptyView()
                    }
                    Picker.init(selection: $mode, label: Text("Mode")) {
                        ForEach(0..<modes.count) {
                            Text(self.modes[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
        }
        .sheet(isPresented: $showPicker, onDismiss: loadImg) {
            MyImagePicker.init(selectImg: self.$selectImg)
        }
        .navigationBarItems(trailing: Button.init("选择照片", action: {
            self.showPicker.toggle()
        }))
    }
    
    func loadImg() {
        if let img = self.selectImg {
            self.image = Image.init(uiImage: img)
        }
    }

}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
