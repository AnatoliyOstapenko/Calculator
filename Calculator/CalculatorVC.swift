//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook on 15.09.2021.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("error in displayValue") }
            print("display value is \(number)")
            return number
        }
        set {
            if newValue == 0 {
                displayLabel.text = String(format: "%.0f", newValue)
                isFinishedTypingNumber = true
                print(displayLabel.text!)
            } else {
                displayLabel.text = String(newValue)
            }
            

        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        guard let action = sender.currentTitle else { return }
        
        // operation block of code
        switch action {
        case "AC":
            displayValue = 0
        case "+/-":
            displayValue *= -1
        case "%":
            displayValue = displayValue / 100
        default:
            displayValue = 0

        }
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        
        if isFinishedTypingNumber == true {
            displayLabel.text = number
            isFinishedTypingNumber = false
        } else {
            
            // magic block of code:
            if number == "." {
                
                // floor remove the fractional part and round down
                let isInt = floor(displayValue) == displayValue

                if !isInt {
                    return
                }
                
            } // magic is over


            displayLabel.text! += number
            
            
        }
    }
}

