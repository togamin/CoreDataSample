//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Togami Yuki on 2018/09/17.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var QList:[question]!
    
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var memo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.QList = Qread()
    }
    
    @IBAction func Qbtn(_ sender: UIButton) {
        var random = arc4random_uniform(UInt32(self.QList.count))
        var question = self.QList[Int(random)].question
        var memo = self.QList[Int(random)].memo
        self.Question.text = question
        self.memo.text = memo
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

