//
//  ViewController.swift
//  Calculator
//
//  Created by Nikola Bojkovic on 6/10/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ResultLabel.text = "0"
    }

    @IBOutlet weak var ResultLabel: UILabel!
    var calculatedResult = 0.00
    var currentNumber = 0.00
    var operation = "none"
    var resetLabel = false
    
    @IBAction func Number(_ sender: UIButton) {
        if sender.titleLabel?.text == "0" && ResultLabel.text == "0" {
            return
        }
        
        if (sender.titleLabel?.text != "0" && ResultLabel.text == "0") {
            ResultLabel.text = sender.titleLabel?.text
            currentNumber = (NumberFormatter().number(from: (sender.titleLabel?.text)!)?.doubleValue)!
            return
        }
        
        if resetLabel {
            if operation == "equal" {
                calculatedResult = (NumberFormatter().number(from: (sender.titleLabel?.text)!)?.doubleValue)!
            }
            
            ResultLabel.text = sender.titleLabel?.text
            currentNumber = (NumberFormatter().number(from: (sender.titleLabel?.text)!)?.doubleValue)!
            
            resetLabel = false
            return
        }
        
        ResultLabel.text?.append((sender.titleLabel?.text)!)
        currentNumber = (NumberFormatter().number(from: (ResultLabel.text)!)?.doubleValue)!
    }
    
    @IBAction func Add(_ sender: UIButton) {
        
        operation = "add"
        if currentNumber == 0 {
            return
        }
        
        resetLabel = true
        calculatedResult += currentNumber
        ResultLabel.text = "\(calculatedResult)"
        currentNumber = 0.00
    }
    
    @IBAction func Equals(_ sender: UIButton) {
        
        if operation == "none" {
            return
        }
        
        if operation == "add" {
            calculatedResult += currentNumber
            currentNumber = 0.00
            operation = "none"
        }
        
        resetLabel = true
        ResultLabel.text = "\(calculatedResult)"
        operation = "equal"
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        ResultLabel.text = "0"
        calculatedResult = 0
        operation = "none"
        resetLabel = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

