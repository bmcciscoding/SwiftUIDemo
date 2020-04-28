//
//  ListScrollView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/24.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

struct ListScrollView: View {
    
    
    @State
    var showIndex = 1
    
    var lists = ["Scroll", "Group List", "Plain List"]
    
    var datas = [1, 2, 3]
    
    @State
    var style = false
        
    var body: some View {
        VStack {
            Picker.init("List", selection: $showIndex) {
                ForEach(0..<self.lists.count) {
                    Text("\(self.lists[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())

            if (showIndex == 0) {
                ScrollView {
                    ForEach(0..<datas.count) {
                        Text("\(self.datas[$0])")
                    }
                    Section(header: Text("Section")) {
                        Text("Section")
                    }
                }
            } else if (showIndex == 1) {
                List {
                    Section(header: Text("ForEach")) {
                        ForEach(0..<datas.count) {
                            Text("\(self.datas[$0])")
                        }
                    }
                    Section(header: Text("Section Header"), footer: Text("Footer")) {
                        Text("Section")
                    }
                    Section(header: Text("Group")) {
                        VStack {
                            HStack {
                                Group {
                                    Text("1")
                                    Text("2")
                                    Text("3")
                                    Text("4")
                                    Text("5")
                                }
                                Group {
                                    Text("6")
                                    Text("7")
                                    Text("8")
                                    Text("9")
                                    Text("10")
                                    Text("11")
                                }
                            }.background(Color.red)
                            HStack {
                                Text("1")
                                Text("2")
                                Text("3")
                                Text("4")
                                Text("5")
                                Text("6")
                                Text("7")
                                Text("8")
                                Text("9")
                                Text("10")
                                // Text("11") // open the line will error
                            }.background(Color.blue)
                        }
                    }

                }.listStyle(GroupedListStyle())
            } else if (showIndex == 2) {
                List {
                    ForEach(0..<datas.count) {
                        Text("\(self.datas[$0])")
                    }
                    Section(header: Text("Section")) {
                        Text("Section")
                    }
                    VStack {
                        Text("1")
                        Text("2")
                        Text("3")
                        Text("4")
                        Text("5")
                        Text("6")
                        Text("7")
                        Text("8")
                        Text("9")
                        Text("10 can not add 11 unless use group")
                    }
                }.listStyle(PlainListStyle())
            }
        }

    }
}

struct ListScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ListScrollView()
    }
}
