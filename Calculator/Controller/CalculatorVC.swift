//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook on 15.09.2021.
//

import UIKit

class CalculatorVC: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatingLogic()
    
    @IBOutlet weak var displayLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
 
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }

        

    }
}


