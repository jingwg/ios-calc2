//
//  SecondViewController.swift
//  simple-cal2
//
//  Created by chelseaGJW on 16/4/26.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var historyView: UILabel!
    var labeltest = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.text = labeltest
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
