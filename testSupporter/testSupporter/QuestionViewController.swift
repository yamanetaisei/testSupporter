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
        
        form +++
            MultivaluedSection(multivaluedOptions: [.Delete, .Insert ],header: "解答") { answer in
                
                answer.addButtonProvider = { section in
                    return ButtonRow(){
                        section.showInsertIconInAddButton = false
                        print(section)
                        $0.title = "回答欄を追加"
                    }
                }
                                
                answer.multivaluedRowToInsertAt = { index in
                    return NameRow(){
                        answer.showInsertIconInAddButton = false
                        $0.placeholder = "問\(index + 1)"
                        print(index)
                    }
                }
                answer <<< NameRow() {
                    $0.placeholder = "問１"
                }
            }
            +++ Section()
            <<< ButtonRow("採点を行う")
    }
}


