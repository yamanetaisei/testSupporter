//
//  ResultViewController.swift
//  testSupporter
//
//  Created by 山根大生 on 2020/05/02.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class ScoringViewController: FormViewController{
    //入力された解答をココで受け取る
    var scoringAnswers : Array<String?> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(scoringAnswers)
        form +++ SelectableSection<ListCheckRow<String?>>("採点", selectionType: .multipleSelection)
        for answers in scoringAnswers{
            form.last! <<< ListCheckRow<String?>(answers){ listRow in
                listRow.title = answers
                listRow.selectableValue = answers
            }
        }
    }
}

