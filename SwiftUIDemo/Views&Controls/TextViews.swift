//
//  TextViews.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/9/22.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct TextViews: View {
    
    @State
    var textFieldString: String = "This is a text field"
    
    @State
    var secureFieldString: String = "This is a text field"
    
    @State
    var textEditorString = "This is TextEditor"
    
    var body: some View {
        VStack {
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
        
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViews()
    }
}
