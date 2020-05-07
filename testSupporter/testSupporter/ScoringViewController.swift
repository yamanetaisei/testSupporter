//
//  ResultViewController.swift
//  testSupporter
//
//  Created by 山根大生 on 2020/05/02.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit

class ScoringViewController: UIViewController{
    //入力された解答をココで受け取る
    var scoringAnswers : Array<Any?> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scoringAnswers)
    }
}
