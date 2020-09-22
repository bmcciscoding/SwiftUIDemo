//
//  StateView.swift
//  TomatoClock
//
//  Created by qiupeng on 2020/4/15.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import SwiftUI

class StateViewModel: ObservableObject {
    @Published
    var show: Bool = false
}

struct StateSubView: View {
    
    
    @Binding
    var show: Bool
    
    var body: some View {
        Text(show ? "Show" : "Hide")
    }
}


class MyData: ObservableObject {
    var text = "tap me "
}

struct StateView: View {
    
    @ObservedObject
    var data = MyData.init()
    
    @State
    var text = "tap me to load data"
    
    @State
    var sUserInfo = UserInfo.init()
    
    @ObservedObject
    var oUserInfo = UserInfo.init()
    
    @ObservedObject
    var userInfo = UserInfo.init()
    
    @State
    var showName = true

    var body: some View {
        VStack {
            Text(self.text).onAppear {
                
            }.onTapGesture {
                DispatchQueue.global().async {
                    self.text += " 1 "
                }
            }
            Text(self.data.text).onAppear {
                
            }.onTapGesture {
                self.data.text += " 1 "
            }
            Text(userInfo.name).onTapGesture {
                self.userInfo.name += "x"
            }
            Text(self.showName ? "show" : "hide")
            UserInfoView.init()
            
        }.environmentObject(UserInfo.init())
    }
    
    func loadData() {
        self.text = "loading..."
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.text = "load data"
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}


class UserInfo: ObservableObject {
    @Published
    var name = "zhangsan"
    
    static let shared = UserInfo.init()
}

struct UserInfoView: View {
        
    @EnvironmentObject
    var info: UserInfo

    var body: some View {
        Text(info.name)
    }
}

