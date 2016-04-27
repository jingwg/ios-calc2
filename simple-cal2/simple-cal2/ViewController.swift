//
//  ViewController.swift
//  simple-cal2
//
//  Created by chelseaGJW on 16/4/26.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
   
    @IBOutlet var display: UILabel!
        
    @IBOutlet var history: UILabel!
    
    var result: Int = 0
    var eachInputString = String()
    var inputNum: Int = 0
    var userIsEntering = false
    var enteredOp = false
    var operatorButton = String()
    var numArray = [Int]()
    
    
    
    @IBAction func numInput(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsEntering {
            display.text = display.text! + digit
            eachInputString = eachInputString + digit
            
        }else{
            display.text =  digit
            eachInputString = digit
            userIsEntering = true
        }
    }
    
    
    
    
    @IBAction func operation(sender: UIButton) {
        let currentOp = sender.currentTitle!
        if(enteredOp == false){
            inputNum = Int(eachInputString)!
            operatorButton = sender.currentTitle! //two kinds swith operatorButton
            switch currentOp {
            case "+", "-", "/", "*", "%","Fact":
                result = inputNum
                display.text = display.text! + " \(currentOp) "
                eachInputString = ""
                
            case "Count", "Average": numArray.append(inputNum)
            eachInputString = ""
            display.text = display.text! + " \(currentOp) "
            default: break
            }
            enteredOp = true
            
        }else{
            if(operatorButton != "Fact"){
                inputNum = Int(eachInputString)!
            }
            
            switch operatorButton{
            case "Fact" : result = 1
            for index in 1...inputNum {
                result = result * index
                }
                
            case "+" : result = result + inputNum
            case "-" : result = result - inputNum
            case "/" : result = result/inputNum
            case "*" : result = result * inputNum
            case "%" : result = result % inputNum
            case "Count", "Average" :
                numArray.append(inputNum)
                display.text = display.text! + " " + operatorButton
                if (currentOp == "="){
                    switch operatorButton {
                    case "Count": result = numArray.count
                    case "Average" : for num in numArray {
                        result = result + num
                    }
                    result = result/numArray.count
                    default: break
                    }
                }
            default: break
            }
        }
        
        if (currentOp == "="){
            display.text = display.text! + " = \(result)"
        }
    }
    
    
    @IBAction func clear(sender: UIButton) {
        history.text = history.text! + "\n" + display.text!
        display.text = "0"
        result = 0
        userIsEntering = false
        enteredOp = false
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destViewController : SecondViewController = segue.destinationViewController as! SecondViewController
        destViewController.labeltest = history.text!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}




