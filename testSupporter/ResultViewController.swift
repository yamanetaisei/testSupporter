//
//  ResultViewController.swift
//  testSupporter
//
//  Created by 山根大生 on 2020/05/17.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit

class ResultViewConrtroller:UIViewController{
    
    @IBOutlet weak var resultText: UILabel!
    var result:Int = 0
    
    @IBAction func endButton(_ sender: Any) {
        self.self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    func setText(){
        resultText.text = "正答率は\(result)%です"
    }
}
