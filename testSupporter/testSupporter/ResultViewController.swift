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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    func setText(){
        resultText.text = "正答率は\(result)%です"
    }
}
