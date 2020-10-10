//
//  CombineViewController.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/10/10.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import UIKit
import Combine

class CombineViewController: UIViewController {

    let textfiled = UITextField.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let pub = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        pub.sink(receiveCompletion: { print($0) }, receiveValue: { print($0)})



    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
