//
//  FieldView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/21.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI


struct KeyboardView<Content: View>: View {
    
    @State
    var kbHeight: CGFloat = 0
    
    let showKbPublisher = NotificationCenter.Publisher
        .init(center: .default, name: UIResponder.keyboardWillShowNotification)
        .map { (no) -> CGFloat in
            if let rect = no.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
                return rect.size.height - 49
            }
            return 0
        }
    
    let hideKbPublisher = NotificationCenter.Publisher
        .init(center: .default, name: UIResponder.keyboardWillHideNotification)
        .map { (no) -> CGFloat in
            return 0
        }
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
            Rectangle()
                .frame(height: self.kbHeight)
                .foregroundColor(.red)
                .animation(.default)
                .onReceive(self.showKbPublisher.merge(with: self.hideKbPublisher)) { (height) in
                    self.kbHeight = height
            }
        }
    }
}


struct FieldView: View {
    @State
    var account = ""
    @State
    var password = ""
    
    @State
    var showPassword = false
    
    var pwdString: String {
        var s = ""
        for _ in 0..<password.count {
            s += "*"
        }
        return showPassword ? password : s
    }
    
    @State
    var kbType: Bool = false
    
    var body: some View {
        KeyboardView {
            List {
                Text(account).frame(height: 200)
                Section(header: Text("Text Field Style")) {
                    TextField.init("email", text: $account).textFieldStyle(PlainTextFieldStyle()).keyboardType(.emailAddress)
                    TextField.init("email", text: $account).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField.init("email", text: $account).textFieldStyle(DefaultTextFieldStyle())
                }
                Section(header: Text("Adajusting Text")) {
                    TextField.init("email", text: $account)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(kbType ? .emailAddress : .numberPad)
                    Toggle.init("keyboard type", isOn: $kbType)
                }
                Section(header: Text("SecureField")) {
                    SecureField.init("password", text: $password) {}
                }
                Section(header: Text("SecureField")) {
                    SecureField.init("password", text: $password) {}
                }
                Section(header: Text("SecureField")) {
                    SecureField.init("password", text: $password) {}
                }
            }.onTapGesture {
                print("hide keyboard")
                //UIApplication.shared.keyWindow?.endEditing(true)
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView()
    }
}
