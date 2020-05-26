//
//  ImageView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct LayoutDemoView: View {
    var body: some View {
        Text("SwiftUI Layout")
            .background(Color.red.opacity(0.4))
            .padding()
            .background(Color.red.opacity(0.2))
    }
}

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
    var modes = ["stretch", "tile"]
    
    var body: some View {
        VStack {
            
            Image("test")
                .offset(x: 10, y: 0)
                .border(Color.gray)
            
            Text("Hello world!")
            .font(.title)
            //.offset(x: 50, y: 10)
        
            .border(Color.gray)
            
            
//            VStack(alignment: .leading) {
//                ForEach(0..<10) { position in
//                    Text("Number \(position)")
//                        .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
//                }
//            }
//            .background(Color.red)
//            .offset(x: 10, y: 10)
//            .frame(width: 400, height: 400)
//            .background(Color.blue)
//
//            Text("A single line of text, too long to fit in a box.")
//            .background(Color.blue.opacity(0.2))
//            .fixedSize()
//            .frame(width: 200, height: 200)
//            .border(Color.gray)
//
//            Text("A single line of text, too long to fit in a box.")
//            .background(Color.blue.opacity(0.2))
//            .frame(width: 200, height: 200)
//            .border(Color.gray)
//
//            Text("A single line of text, too long to fit in a box.")
//                .background(Color.blue.opacity(0.4))
//                .frame(minWidth: 20,
//                       idealWidth: 150,
//                       maxWidth: 300,
//                       minHeight: 40,
//                       idealHeight: 80,
//                       maxHeight: 160,
//                       alignment: .center)
//                .fixedSize(horizontal: true, vertical: false)
//                .background(Color.blue.opacity(0.2))
                
                
        }

//        ScrollView {
//            HStack {
//                Spacer().background(Color.red)
//            }
//            Image("test").border(Color.gray)
//
//            HStack {
//                    Image("test")
//                      .resizable()
//                      .border(Color.gray)
//                      .frame(width: 200, height: 200)
//                      .border(Color.yellow)
//            }
//
//
//
//            Image("test")
//                .resizable()
//                .scaledToFill()
//                .border(Color.gray)
//                .frame(width: 200, height: 200)
//                .border(Color.yellow)
//
//
//            Image("test")
//                .resizable()
//                .scaledToFit()
//                .border(Color.gray)
//                .frame(width: 200, height: 200)
//                .border(Color.yellow)
//        }
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
