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
import CDAlertView

class ScoringViewController: FormViewController{
    //入力された解答をココで受け取る
    var scoringAnswers : Array<String?> = []
    var tagNumber : Int = 0
    var countCorrect:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ SelectableSection<ListCheckRow<String?>>("採点", selectionType: .multipleSelection)
        for answers in scoringAnswers{
            form.last! <<< ListCheckRow<String?>(answers){ listRow in
                listRow.tag = "\(tagNumber)"
                if answers != nil{
                    listRow.title = "問\(tagNumber + 1)　　" + answers!
                }else{
                    listRow.title = "問\(tagNumber + 1)"
                }
                listRow.selectableValue = answers
                if tagNumber%2 != 0 {
                    listRow.baseCell.backgroundColor = UIColor(hex: "#F8F8FF")
                }
                listRow.onChange(){_ in
                    if listRow.value != nil {
                        self.countCorrect += 1
                    }else{
                        self.countCorrect -= 1
                    }
                }
                tagNumber += 1
            }
        }
        form +++ Section()
            <<< ButtonRow(){
                $0.title = "採点を終わる"
                $0.onCellSelection(){_,_ in
                    let score = self.Aggregate(correct: self.countCorrect, base: self.scoringAnswers)
                    let storyboard: UIStoryboard = self.storyboard!
                    let second = storyboard.instantiateViewController(withIdentifier: "result") as! ResultViewConrtroller
                    second.result = score
                    self.present(second, animated: true, completion: nil)
                }
            }
    }
    
    override func viewDidLayoutSubviews() {
        showAlert()
    }
    
    func Aggregate(correct:Int,base:[String?]) -> Int {
        let correct = Double(correct)
        let base = Double(base.count)
        let score = correct/base*100
        let finalScore = Int(score)
        return finalScore
    }
    
    func showAlert(){
        let alert = CDAlertView(title: "採点を行いましょう", message: "正解した問題に\nチェックマークをつけましょう", type: .success)
        let doneAction = CDAlertViewAction(title: "OK!")
        alert.add(action: doneAction)
        alert.show()
    }
}

