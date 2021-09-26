//
//  CalculatingLogic.swift
//  Calculator
//
//  Created by MacBook on 26.09.2021.
//

import Foundation

class CalculatingLogic {
    
    var label: String = ""
    var finish: Bool = true
    
    var displayValue: Double {
        get {
            guard let number = Double(label) else { fatalError("error in displayValue") }
            print("display value is \(number)")
            return number
        }
        set {
            if newValue == 0 {
                label = String(format: "%.0f", newValue)
                finish = true
            } else {
                label = String(newValue)
            }
        }
    }
    
    func action(_ action: String) {
        
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
    
    func number(_ number: String) {
        
        if finish == true {
            label = number
            finish = false
        } else {
            
            // magic block of code:
            if number == "." {
                
                // floor remove the fractional part and round down
                let isInt = floor(displayValue) == displayValue
                
                if !isInt {
                    return
                }
                
            } // magic is over
            
            label += number
        }
    }
}
