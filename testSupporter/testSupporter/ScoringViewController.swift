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
    var tagNumber : Int = 0
    var count:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ SelectableSection<ListCheckRow<String?>>("採点", selectionType: .multipleSelection)
        for answers in scoringAnswers{
            form.last! <<< ListCheckRow<String?>(answers){ listRow in
                listRow.title = answers
                listRow.tag = "\(tagNumber)"
                listRow.selectableValue = answers
                listRow.onChange(){_ in
                    if listRow.value != nil {
                        self.count += 1
                    }else{
                        self.count -= 1
                    }
                }
                tagNumber += 1
            }
        }
        form +++ Section()
            <<< ButtonRow(){
                $0.title = "採点を終わる"
                $0.onCellSelection(){_,_ in
                    print(self.count)
                }
            }
    }
}

