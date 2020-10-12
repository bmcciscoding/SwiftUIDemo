//
//  CombineViewController.swift
//  SwiftUIDemo
//
//  Created by qiupeng on 2020/10/10.
//  Copyright © 2020 qiupeng. All rights reserved.
//

import UIKit
import Combine
import Foundation


class CombineViewModel2 {

    lazy var login = PassthroughSubject<Bool, Never>()



}


class CombineViewController: UIViewController {

    let textfiled = UITextField.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        

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
