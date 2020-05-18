//
//  ViewController.swift
//  testSupporter
//
//  Created by 山根大生 on 2020/04/19.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goQuestion(_ sender: Any) {
         let storyboard: UIStoryboard = self.storyboard!
         let second = storyboard.instantiateViewController(withIdentifier: "question")
         self.present(second, animated: true, completion: nil)
    }
    
}

