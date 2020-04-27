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
            MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, ],
                               header: "Multivalued TextField",
                               footer: ".Insert adds a 'Add Item' (Add New Tag) button row as last cell.") {
                //公式ドキュメントのコピペ
                $0.addButtonProvider = { section in
                    return ButtonRow(){
                        $0.title = "Add New Tag"
                    }
                }
                                
                $0.multivaluedRowToInsertAt = { index in
                    return NameRow() {
                        $0.placeholder = "Tag Name"
                        print(index)
                    }
                }
                $0 <<< NameRow() {
                    $0.placeholder = "Tag Name"
                }
            }
        }
    }


