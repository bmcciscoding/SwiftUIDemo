//
//  FrameworkView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/27.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI
import MapKit


struct MyMapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
        
    func makeUIView(context: UIViewRepresentableContext<MyMapView>) -> MKMapView {
        return MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MyMapView>) {
        
    }
}
/// 事件代理
class MyCoordiantor {}

struct MyLoading: UIViewRepresentable {
    
    typealias Coordinator = MyCoordiantor
    
    var show: Bool
    
    func makeUIView(context: UIViewRepresentableContext<MyLoading>) -> UIActivityIndicatorView {
        let v = UIActivityIndicatorView()
        v.style = .large
        return v
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<MyLoading>) {
        if (show) {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
        print(context.coordinator)
    }
    
    func makeCoordinator() -> MyCoordiantor {
        return MyCoordiantor()
    }
}

class MyUIViewController: UIViewController {
    var text: String? {
        didSet {
            self.label.text = text
        }
    }
    
    let label = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(label)
    }
}

struct MyImagePicker: UIViewControllerRepresentable {
    
    @Binding
    var selectImg: UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MyImagePicker>) {
        print("update vc")
    }
    
    class EventDelegate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: MyImagePicker
        
        init(_ picker: MyImagePicker) {
            self.picker = picker;
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("cancel")
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let img = info[.originalImage] as? UIImage {
                self.picker.selectImg = img
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    typealias Coordinator = EventDelegate
    
    func makeCoordinator() -> MyImagePicker.EventDelegate {
        return Coordinator.init(self)
    }
}



struct FrameworkView: View {
    
    @State
    var text: String = "text"
    
    @State
    var show = false
    
    @State
    var showPicker = false
    
    @State
    var selectImg: UIImage?
    
    @State
    var showImg: Image?
    
    var body: some View {
        VStack {
            showImg?.resizable().scaledToFit()
            Text(text)
            MyMapView()
            Button.init("Change") {
                self.text += " x "
                self.show.toggle()
                self.showPicker.toggle()
            }
            
        }.overlay(MyLoading.init(show: show)).sheet(isPresented: $show, onDismiss: loadImage) {
            MyImagePicker.init(selectImg: self.$selectImg)
        }
    }
    
    func loadImage() {
        if let img = self.selectImg {
            self.showImg = Image.init(uiImage: img)
        }
    }
}

struct FrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkView()
    }
}
