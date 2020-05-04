//
//  QuestionViewController.swift
//  testSupporter
//
//  Created by 山根大生 on 2020/04/27.
//  Copyright © 2020 taisei. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class QuestionViewController:FormViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let remind_vc = storyboard.instantiateViewController(withIdentifier: "ScoringViewController") as! ScoringViewController
        
        form +++
            MultivaluedSection(multivaluedOptions: [.Delete, .Insert ],header: "解答") { answer in
                //sectionは回答欄を追加するrowの引数
                answer.addButtonProvider = { section in
                    return ButtonRow(){
                        //アイコンを消している
                        section.showInsertIconInAddButton = false
                        $0.title = "回答欄を追加"
                    }
                }
                                
                answer.multivaluedRowToInsertAt = { index in
                    return TextRow(){
                        answer.showInsertIconInAddButton = false
                        $0.tag = "\(index)"
                        $0.placeholder = "問\(index + 1)"
                    }
                }
                answer <<< TextRow() {
                    $0.tag = "0"
                    $0.placeholder = "問１"
                }
            }
            +++ Section()
            <<< ButtonRow(){
                $0.onCellSelection(){_,_  in
//                    nilやらなんやらでアプリが落ちるポイント↓
                    let teamRow = self.form.values()
                    print(teamRow)
//                    let name = teamRow.value!
                }
                $0.title = "採点を行う"
                $0.presentationMode = .show(controllerProvider: ControllerProvider.callback(builder: {() in remind_vc}),
                                            onDismiss:{ vc in
//                                                print(vc)
//                                                vc.present(remind_vc, animated: true, completion: nil)
                                      
                })
            }
    }
}


